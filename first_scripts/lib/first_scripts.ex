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


  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :uranus | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @planet_years %{:earth => 1,
                  :mercury => 0.2408467,
                  :venus =>  0.61519726,
                  :mars => 1.8808158,
                  :jupiter => 11.862615,
                  :saturn => 29.447498,
                  :uranus => 84.016846,
                  :neptune => 164.79132}

  @year_to_secs 31557600

  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    seconds / (@year_to_secs * @planet_years[planet])
  end

  @doc """
  Merge sort in elixir
  """
  @spec sort([]) :: []
  def sort([]), do: []

  def sort([head| tail]) do
    {smaller, bigger} = Enum.partition(tail, &(&1 < head))
    sort(smaller) ++ [head] ++ sort(bigger)
  end

  @doc """
  Tower of hanoi implementation in Elixir
  """
  @spec hanoi(integer, String.t, String.t, String.t) :: nil
  def hanoi(1, f, _, t), do: move(f, t)

  def move(f, t), do: IO.puts("Moving #{f} to #{t}")

  def hanoi(n, f, h, t) do
    hanoi((n-1), f, t, h)
    hanoi(1, f, h, t)
    hanoi((n-1), h, f, t)
  end
end


FirstScripts.fib(10)
FirstScripts.hello()
FirstScripts.histogram('AAAA')
FirstScripts.age_on(:earth, 1_000_000_000)
FirstScripts.hanoi(10, 'a', 'b', 'c')
