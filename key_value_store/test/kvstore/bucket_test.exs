defmodule KVStoreBucketTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, bucket} = KVStore.Bucket.start_link
    {:ok, bucket: bucket}
  end

  test "Stores a value inside the bucket", %{bucket: bucket} do
    assert KVStore.Bucket.get(bucket, "han") == nil

    KVStore.Bucket.put(bucket, "han", "solo")
    assert KVStore.Bucket.get(bucket, "han") == "solo"
  end

  test "Deletes a value not present in the bucket", %{bucket: bucket} do
    assert KVStore.Bucket.delete(bucket, "han") == nil
  end

  test "Deletes a value present in the bucket", %{bucket: bucket} do
    KVStore.Bucket.put(bucket, "han", "solo")
    assert KVStore.Bucket.delete(bucket, "han") == "solo"
  end
end
