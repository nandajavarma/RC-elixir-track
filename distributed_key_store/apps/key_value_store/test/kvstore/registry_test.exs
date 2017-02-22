defmodule KVStore.RegistryTest do
  use ExUnit.Case, async: true

  setup context do
    {:ok, _} = KVStore.Registry.start_link(context.test)
    {:ok, registry: context.test}
  end

  test "Spawns a bucket", %{registry: registry} do
    assert KVStore.Registry.lookup(registry, "surnames") == :error

    KVStore.Registry.create(registry, "surnames")
    assert {:ok, bucket} = KVStore.Registry.lookup(registry, "surnames")

    KVStore.Bucket.put(bucket, "han", "solo")
    assert KVStore.Bucket.get(bucket, "han") == "solo"
  end

  test "removes buckets on exit", %{registry: registry} do
    KVStore.Registry.create(registry, "surnames")
    assert {:ok, bucket} = KVStore.Registry.lookup(registry, "surnames")
    Agent.stop(bucket)

    _ = KVStore.Registry.create(registry, "dummy")
    assert KVStore.Registry.lookup(registry, "surnames") == :error
  end

  test "removes buckets on crash", %{registry: registry} do
    KVStore.Registry.create(registry, "surnames")
    assert {:ok, bucket} = KVStore.Registry.lookup(registry, "surnames")
    ref = Process.monitor(bucket)
    Process.exit(bucket, :shutdown)
    assert_receive {:DOWN, ^ref, _, _, _}
    _ = KVStore.Registry.create(registry, "dummy")
    assert KVStore.Registry.lookup(registry, "surnames") == :error
  end
end
