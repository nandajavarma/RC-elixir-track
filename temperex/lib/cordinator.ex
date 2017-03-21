defmodule Temperex.Cordinator do
  def loop(results \\[], count) do
    receive do
      {:ok, result} ->
        new_results = [result | results]
        if Enum.count(new_results) == count, do: send self(), :exit
        loop(new_results, count)
      :exit -> results |> Enum.sort |> Enum.join(", ")
      _ -> loop(results, count)
    end
  end
end
