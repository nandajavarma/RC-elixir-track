defmodule RunlengthEnc do
  @moduledoc """
  Documentation for RunlengthEnc.
  """

  @doc """
  """
  def conc_map_elems({k, v}, acc), do: [Integer.to_string(v) <> k | acc]

  def stringify_map(smap) do
    smap |>
      Enum.reduce([], &(conc_map_elems(&1, &2))) |>
         Enum.join("")
  end

  def count_elems([], elems), do: elems

  def count_elems([head | tail], [ehead | etail]) when head == elem(ehead, 0) do
    count_elems(tail, [{elem(ehead, 0), elem(ehead, 1)+1} | etail])
  end

  def count_elems([head | tail], elem) do
    count_elems(tail, [{head, 1} | elem])
  end
  @spec encode(String.t) :: String.t
  def encode(string)
  def encode(""), do: ""

  def encode(string) do
    string |>
      String.graphemes |>
        count_elems([]) |>
          stringify_map
  end
end
