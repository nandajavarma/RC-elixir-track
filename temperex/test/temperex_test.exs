defmodule TemperexTest do
  use ExUnit.Case
  doctest Temperex

  test "get the temperature of New York, kerala and singapore" do
    cities = ["new york", "singapore", "kerala"]
    Temperex.temperature_of(cities)
  end
end
