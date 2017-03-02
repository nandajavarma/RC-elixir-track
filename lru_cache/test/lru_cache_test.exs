defmodule LruCacheTest do
  use ExUnit.Case
  doctest LruCache

  test "Get the LRU caching simulation on string" do
    assert LruCache.get_pages(5, "") == []
    assert LruCache.get_pages(0, "ANFS!FSAN!") == nil
    assert LruCache.get_pages(5, "ABC!DEAF!B!") == ["ABC", "CDEAF", "DEAFB"]
    assert LruCache.get_pages(3, "WXWYZ!YZWYX!XYXY!") == ["WYZ", "WYX", "WXY"]
    assert LruCache.get_pages(5, "EIEIO!") == ["EIO"]
  end
end
