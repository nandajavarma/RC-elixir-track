defmodule Sudoku.BoardTest do
  use ExUnit.Case
  doctest Sudoku.Board

  def sudoku() do
    [[3, 0, 6, 5, 0, 8, 4, 0, 0],
      [5, 2, 0, 0, 0, 0, 0, 0, 0],
      [0, 8, 7, 0, 0, 0, 0, 3, 1],
      [0, 0, 3, 0, 1, 0, 0, 8, 0],
      [9, 0, 0, 8, 6, 3, 0, 0, 5],
      [0, 5, 0, 0, 9, 0, 6, 0, 0],
      [1, 3, 0, 0, 0, 0, 2, 5, 0],
      [0, 0, 0, 0, 0, 0, 0, 7, 4],
      [0, 0, 5, 2, 0, 6, 3, 0, 0]]
  end

  def solved_sudoku() do
   [[3, 1, 6, 5, 7, 8, 4, 9, 2],
    [5, 2, 9, 1, 3, 4, 7, 6, 8],
    [4, 8, 7, 6, 2, 9, 5, 3, 1],
    [2, 6, 3, 4, 1, 5, 9, 8, 7],
    [9, 7, 4, 8, 6, 3, 1, 2, 5],
    [8, 5, 1, 7, 9, 2, 6, 4, 3],
    [1, 3, 8, 9, 4, 7, 2, 5, 6],
    [6, 9, 2, 3, 5, 1, 8, 7, 4],
    [7, 4, 5, 2, 8, 6, 3, 1, 9]]
  end

  def empty_cells() do
    %{{3, 3} => 0, {7, 8} => 0, {4, 0} => 0, {2, 1} => 0, {6, 4} => 0,
      {6, 3} => 0, {5, 7} => 0, {8, 0} => 0, {6, 1} => 0, {0, 2} => 0,
      {7, 0} => 0, {2, 7} => 0, {5, 1} => 0, {0, 7} => 0, {7, 1} => 0,
      {3, 1} => 0, {5, 6} => 0, {6, 2} => 0, {1, 3} => 0, {1, 8} => 0,
      {7, 4} => 0, {3, 5} => 0, {0, 3} => 0, {1, 0} => 0, {7, 5} => 0,
      {4, 7} => 0, {3, 7} => 0, {4, 1} => 0, {5, 2} => 0, {2, 4} => 0,
      {1, 4} => 0, {6, 7} => 0, {4, 2} => 0, {3, 6} => 0, {8, 8} => 0,
      {8, 1} => 0, {5, 3} => 0, {1, 7} => 0, {2, 6} => 0, {8, 5} => 0,
      {5, 5} => 0, {8, 6} => 0, {3, 2} => 0, {4, 6} => 0, {0, 8} => 0,
      {2, 5} => 0, {0, 5} => 0, {8, 3} => 0, {4, 8} => 0}
  end

  #test "solve the sudoku puzzle" do
    #solution = Sudoku.Board.solve(sudoku())
    #assert solution == solved_sudoku()
  #end

  test "if the row has a number" do
    assert Sudoku.Board.used_in_row?(sudoku(), 3, 0) == true
    assert Sudoku.Board.used_in_row?(sudoku(), 2, 1) == true
    assert Sudoku.Board.used_in_row?(sudoku(), 5, 8) == true
    assert Sudoku.Board.used_in_row?(sudoku(), 3, 8) == false
  end

  test "if the column has a number" do
    assert Sudoku.Board.used_in_col?(sudoku(), 3, 0) == true
    assert Sudoku.Board.used_in_col?(sudoku(), 2, 1) == true
    assert Sudoku.Board.used_in_col?(sudoku(), 5, 8) == true
    assert Sudoku.Board.used_in_col?(sudoku(), 3, 7) == false
  end

  test "if the box has a number" do
    assert Sudoku.Board.used_in_the_box?(sudoku(), 3, 1, 0) == true
    assert Sudoku.Board.used_in_the_box?(sudoku(), 5, 8, 6) == true
    assert Sudoku.Board.used_in_the_box?(sudoku(), 1, 8, 6) == false
  end

  test "if safe to place" do
    assert Sudoku.Board.is_safe?(sudoku(), 3, 1, 0) == false
    assert Sudoku.Board.is_safe?(sudoku(), 3, 1, 6) == false
    assert Sudoku.Board.is_safe?(sudoku(), 7, 8, 0) == true
  end

  test "get the empty cells" do
     assert Sudoku.Board.get_empty(sudoku()) == empty_cells()
  end

  test "get possible values for a cell" do
    IO.inspect Sudoku.Board.solve(sudoku(), 8, 8)
    IO.inspect Sudoku.Board.solve(sudoku(), 1, 0)
  end
end
