defmodule Temperex do
  @moduledoc """
  Documentation for Temperex.
  """

  @doc """
  """
  def temperature_of(cities) do
    co_proc = spawn(Temperex.Cordinator, :loop, [[], Enum.count(cities)])
    cities |> Enum.each(fn city ->
      work_proc = spawn(Temperex.Worker, :loop, [])
      send work_proc, {co_proc, city}
    end)
  end
end
