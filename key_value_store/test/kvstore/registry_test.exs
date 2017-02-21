defmodule KVStore.RegistryTest do
  use ExUnit.Case, async: true

  setup context do
    {:ok, registry} = KVStore.Registry.start_link(context.test)
    {:ok, registry: registry}
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
    assert KVStore.Registry.lookup(registry, "surnames") == :error
  end
end
