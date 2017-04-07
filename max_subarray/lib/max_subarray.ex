defmodule MaxSubarray do
  @moduledoc """
  Documentation for MaxSubarray.
  """

  @doc """
  """
  def right_sum([head| tail]), do: right_sum(tail, head)
  def right_sum([], acc), do: acc
  def right_sum([head| tail], acc), do: right_sum(tail, max(acc+head, acc))
  def left_sum(array) do
    {start, [last]} = Enum.split(array, -1)
    left_sum(start, last)
  end
  def left_sum([], acc), do: acc
  def left_sum(array, acc) do
    {start, [last]} = Enum.split(array, -1)
    left_sum(start, max(acc+last, acc))
  end

  def get_max_subarray([]), do: 0
  def get_max_subarray([one]), do: one

  def get_max_subarray(array) do
    {left, right} = Enum.split(array, length(array) |> div(2))
    Enum.max([Enum.max([get_max_subarray(left), get_max_subarray(right)]), left_sum(left) +  right_sum(right)])
  end
end
