defmodule Temperex.Cordinator do
  def loop(results \\[], count) do
    receive do
      {:ok, result} ->
        new_results = [result | results]
        if Enum.count(new_results) == count, do: send(self(), :exit)
        loop(new_results, count)
      :exit -> r = results |> Enum.sort |> Enum.join(", ")
      IO.inspect r
      r
      _ -> loop(results, count)
    end
  end
end
