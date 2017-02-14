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
end


FirstScripts.fib(10)
