defmodule Nqueensproblem do
  @moduledoc """
  Documentation for Nqueensproblem.
  """

  @doc """
  """

  def is_safe([], _r, _c), do: true

  def is_safe([{r, c} | _tail], row, col) when r == row or c == col, do: false
  def is_safe([{r, c} | _tail], row, col) when abs(row - r) == abs(col - c), do: false

  def is_safe([_head | tail], row, col), do: is_safe(tail, row, col)

  def place_the_queens(n, row \\ 0, col \\0, result \\ [])

  def place_the_queens(0,   _, _, _), do: []

  def place_the_queens(n, _row, _col, result) when length(result) == n do
   result
  end

  def place_the_queens(n, row, _col, [{r, c}| tail]) when row == n do
      place_the_queens(n, r+1, c, tail)
  end

  def place_the_queens(n, row, col, result) do
    case is_safe(result, row, col) do
      true -> place_the_queens(n, 0, col + 1, [{row, col} | result])
      _ ->  place_the_queens(n, row + 1, col, result)
    end
  end

end
