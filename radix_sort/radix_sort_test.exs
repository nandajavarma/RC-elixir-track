ExUnit.start

defmodule RadixSortTest do
  use ExUnit.Case, async: true


  test "biggest number with an empty list" do
    assert RadixSort.biggest_number([]) == nil
  end

  test "biggest number with a single digit list" do
    assert RadixSort.biggest_number([1]) == 1
  end

  test "biggest number with a valid list" do
    assert RadixSort.biggest_number([1, 2, 3]) == 1
  end
  test "biggest number with another list" do
    assert RadixSort.biggest_number([101,179, 45, 2, 3]) == 3
  end
  test "radix sort for an empty list" do
    assert RadixSort.sort([]) == []
  end
  test "radix sort for single element list" do
    assert RadixSort.sort([1]) == [1]
  end
  test "radix sort for multiple element list" do
    assert RadixSort.sort([2, 10, 1]) == [1, 2, 10]
  end

  test "radix sort for multiple element list - 2" do
    assert RadixSort.sort([100, 5000, 94, 1, 0, 3]) == [0, 1, 3, 94, 100, 5000]
  end
end
