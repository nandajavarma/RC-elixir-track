defmodule NqueensproblemTest do
  use ExUnit.Case
  doctest Nqueensproblem

  test "is safe" do
    assert Nqueensproblem.is_safe([{1,2}], 1, 4) == false
    assert Nqueensproblem.is_safe([{1,1}], 0, 0) == false
    assert Nqueensproblem.is_safe([{0,0}], 1, 2) == true
  end
  test "nqueens for a board with zero grids" do
    assert Nqueensproblem.place_the_queens(0) == []
  end

  test "nqueen arrangement for different n values" do
    assert Nqueensproblem.place_the_queens(4) == [{2, 3}, {0, 2}, {3, 1}, {1, 0}]
    assert Nqueensproblem.place_the_queens(5) == [{3, 4}, {1, 3}, {4, 2}, {2, 1}, {0, 0}]
  end
end
