defmodule FirstScripts do
  @moduledoc """
  Some basic problems solved using Elixir
  """

  @doc """
  Fibonacci series solved using Elixir

  """
  @start [0, 1]
  def fib(acc, n) do
    case n do
      0 -> acc
      _ -> fib(acc ++ [Enum.at(acc, -2) + Enum.at(acc, -1)], (n - 1))
    end
  end

  def fib(n) do
    if n >= 2 do
      fib(@start, (n-2))
    else
      Enum.take @start, n
    end
  end

  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
      Enum.count(strand, &(&1 == nucleotide))
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    for n <- @nucleotides, into: %{}, do: {n, count(strand, n)}
  end

  @doc """
  Greets the user by name, or by saying "Hello, World!"
  if no name is given.
  """
  @spec hello(String.t) :: String.t
  def hello(name \\ "World") do
      "Hello, " <> "#{name}!"
  end
end


FirstScripts.fib(10)
FirstScripts.hello()
FirstScripts.histogram('AAAA')
