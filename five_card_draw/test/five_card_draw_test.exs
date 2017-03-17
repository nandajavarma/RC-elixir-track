defmodule FiveCardDrawTest do
  use ExUnit.Case
  doctest FiveCardDraw

  test "build the deck" do
    deck = FiveCardDraw.build_deck()
    assert length(deck) == 52
    hearts = Enum.filter(deck, fn x -> elem(x, 0) == "hearts" end)
    spades = Enum.filter(deck, fn x -> elem(x, 0) == "spades" end)
    clubs = Enum.filter(deck, fn x -> elem(x, 0) == "clubs" end)
    diamonds = Enum.filter(deck, fn x -> elem(x, 0) == "diamonds" end)
    assert length(diamonds) == 13
    assert length(hearts) == 13
    assert length(clubs) == 13
    assert length(spades) == 13
  end
end
