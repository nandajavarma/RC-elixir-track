defmodule Fizzbuzz do
  @moduledoc """
  Documentation for Fizzbuzz.
  """

  @doc """
  """

  def counter(alist, acc \\ [])
  def counter([], acc), do: acc
  def counter([head| tail], acc) when rem(head, 5) ==0, do: counter(tail, acc ++ ["Buzz"])
  def counter([head| tail], acc) when rem(head, 3) ==0, do: counter(tail, acc ++ ["Fizz"])
  def counter([head| tail], acc), do: counter(tail, acc ++ [head])

  def get_fizzbuzz(count), do: counter(:lists.seq(1, count))
end
