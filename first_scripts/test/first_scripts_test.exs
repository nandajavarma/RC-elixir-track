defmodule FirstScriptsTest do
  use ExUnit.Case
  doctest FirstScripts

  test "Get the fibonacci of 5" do
    assert FirstScripts.fib(5) == [0, 1, 1, 2, 3]
  end

  test "Wrong the fibonacci of 5" do
    refute FirstScripts.fib(5) == [0, 1, 1, 2, 3, 5]
  end
end
