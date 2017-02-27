defmodule BloomFilterTest do
  use ExUnit.Case, async: false
  doctest BloomFilter

  setup_all do
    filter = BloomFilter.init(8)
    {:ok, filter: filter}
  end

  test "create the filter bit map", %{filter: filter} do
    assert %{'bitmap' => _, 'hash_functions' => _} = filter
  end

  test "add element to the filter", %{filter: filter} do
     filter = BloomFilter.add(filter, 20)
     assert BloomFilter.in?(filter, 20)
     refute BloomFilter.in?(filter, 21)
  end

end
