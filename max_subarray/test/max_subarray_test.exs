defmodule MaxSubarrayTest do
  use ExUnit.Case
  doctest MaxSubarray

  test "sum of elements of a list" do
    assert MaxSubarray.sum([1,2,3,4]) == 10
    assert MaxSubarray.sum([1,-2,3,4]) == 8
  end
  test "get maximum subarray" do
    assert MaxSubarray.get_max_subarray([1,2,3,4]) == 10
    assert MaxSubarray.get_max_subarray([-2, -5, 6, -2, -3, 1, 5, -6]) == 7
    assert MaxSubarray.get_max_subarray([4,3,-100,-200,4]) == 7
  end
end
