defmodule Sudoku.Board do
  @moduledoc """
  Documentation for SudokuSolver.
  """

  @doc """
  """
  def get_cell(sudoku, row, column) do
    Enum.at(Enum.at(sudoku, column), row)
  end

  def is_empty?(sudoku, row, column) do
    case get_cell(sudoku, row, column) do
      0 -> true
      _ -> false
    end
  end

  def used_in_col?(sudoku, val, column, row \\ 0)

  def used_in_col?(_sudoku, _val, _column, 9), do: false

  def used_in_col?(sudoku, val, column, row) do
    case get_cell(sudoku, row, column) == val do
      true -> true
      false -> used_in_col?(sudoku, val, column, row + 1)
    end
  end

  def used_in_row?(sudoku, val, row, column \\ 0)

  def used_in_row?(_sudoku, _val, _row, 9), do: false

  def used_in_row?(sudoku, val, row, column) do
    case get_cell(sudoku, row, column) == val do
      true -> true
      false -> used_in_row?(sudoku, val, row, column + 1)
    end
  end


  def used_in_the_box?(_, _, _, _, 2, 2), do: false

  def used_in_the_box?(sudoku, val, row_start, col_start, 2, col_it) do
    used_in_the_box?(sudoku, val, row_start, col_start, 0, col_it+1)
  end

  def used_in_the_box?(sudoku, val, row_start, col_start, row_it, col_it) do
    case get_cell(sudoku, row_start+ row_it, col_start+col_it) == val do
      true -> true
      false -> used_in_the_box?(sudoku, val, row_start, col_start, row_it+1, col_it)
    end
  end

  def used_in_the_box?(sudoku, val, row, col) do
    used_in_the_box?(sudoku, val, row-rem(row,3), col-rem(col,3), 0, 0)
  end

  def is_safe?(sudoku, val, row, col) do
    if (used_in_the_box?(sudoku, val, row, col) or used_in_col?(sudoku, val, row, col) or used_in_row?(sudoku, val, row, col)) do
      false
    else
      true
    end
  end

  def get_box_cells(box_elms, _, 3, _, _), do: box_elms

  def get_box_cells(box_elms, 3, col_iter, row_start, col_start) do
    get_box_cells(box_elms, 0, col_iter+1, row_start, col_start)
  end
  def get_box_cells(box_elms, row_iter, col_iter, rowstart, colstart) do
    get_box_cells([{rowstart+row_iter, colstart+col_iter}|box_elms], row_iter + 1, col_iter, rowstart, colstart)
  end

  def get_row_cells(col_elms, row, 9), do: col_elms
  def get_row_cells(col_elms, row, col) do
    get_row_cells([{row, col}| col_elms], row, col+1)
  end
  def get_col_cells(col_elms, 9, col), do: col_elms
  def get_col_cells(col_elms, row, col) do
    get_col_cells([{row, col}| col_elms], row+1, col)
  end

  def get_dep_cells(row, col) do
    get_box_cells([], 0, 0, row - rem(row, 3), col - rem(col, 3)) ++
        get_col_cells([], 0, col) ++
          get_row_cells([], row, 0)
  end

  def get_possible_values(sudoku, clist, [], pos_vals), do: pos_vals

  def get_possible_values(sudoku, clist, [{r,c} | dep_cell], pos_vals \\ :lists.seq(1,9)) do
    case get_cell(sudoku, r, c) do
      0 -> case Map.get(clist, {r, c}, 0) do
              0 -> get_possible_values(sudoku, clist, dep_cell, pos_vals)
              val -> get_possible_values(sudoku, clist, dep_cell, List.delete(pos_vals, val))
           end
      num -> get_possible_values(sudoku, clist, dep_cell, List.delete(pos_vals, num))
    end
  end

  def get_empty(sudoku, row\\0, col\\0, empty_map \\ %{})
  def get_empty(_, _, 9, empty_map), do: empty_map
  def get_empty(sudoku, 9, col, empty_map), do: get_empty(sudoku, 0, col+1, empty_map)

  def get_empty(sudoku, row, col, empty_map) do
    case is_empty?(sudoku, row, col) do
      true -> get_empty(sudoku, row+1, col, Map.put(empty_map, {row, col}, 0))
      false -> get_empty(sudoku, row + 1, col, empty_map)
    end
  end

  def solve(sudoku) do
    solve(sudoku, 0, 0, get_empty(sudoku), get_dep_cells(row, column))
  end


  def place_the_num(elem, cmap, row, col) do
    Map.update(cmap, {row, col}, elem, fn _ -> elem)
  end

  def solve(sudoku, row, column, cmap, deps_list) do
    get_possible_values(sudoku, cmap, deps_list) |>
          first |>

  end
end
