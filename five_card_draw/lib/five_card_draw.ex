defmodule FiveCardDraw do
  @moduledoc """
  Documentation for FiveCardDraw.
  """
  def shapes(), do: ["hearts", "spades", "clubs", "diamonds"]
  def ranks(), do: ["k", "q", "j", "a", "9","8","7","6","5","4","3","2", "1"]


  @doc """
  """
  def rank_match(shape) do
    for r <- ranks(), do: {shape, r}
  end

  def shuffle(deck), do: Enum.shuffle(deck)
  def build_deck() do
    shapes() |>
      Enum.map(fn x -> rank_match(x) end) |>
        List.flatten |>
          shuffle()
  end
end
