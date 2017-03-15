defmodule FizzbuzzTest do
  use ExUnit.Case
  doctest Fizzbuzz

  test "fizzbuzz counter" do
    fizzbuzz_list = Fizzbuzz.counter(:lists.seq(1,10))
    assert fizzbuzz_list == [1, 2, "Fizz", 4, "Buzz","Fizz", 7, 8, "Fizz",  "Buzz"]
  end

  test "get fizzbuzz" do
    assert Fizzbuzz.get_fizzbuzz(10) == [1, 2, "Fizz", 4, "Buzz","Fizz", 7, 8, "Fizz",  "Buzz"]
  end
end
