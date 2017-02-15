defmodule FirstScriptsTest do
  use ExUnit.Case
  doctest FirstScripts

  test "Get the fibonacci of 5" do
    assert FirstScripts.fib(5) == [0, 1, 1, 2, 3]
  end

  test "Wrong the fibonacci of 5" do
    refute FirstScripts.fib(5) == [0, 1, 1, 2, 3, 5]
  end
  #
  # @tag :pending
  test "empty dna string has no adenine" do
    assert FirstScripts.count('', ?A) == 0
  end

  #@tag :pending
  test "repetitive cytosine gets counted" do
    assert FirstScripts.count('CCCCC', ?C) == 5
  end

  #@tag :pending
  test "counts only thymine" do
    assert FirstScripts.count('GGGGGTAACCCGG', ?T) == 1
  end

  #@tag :pending
  test "empty dna string has no nucleotides" do
    expected = %{?A => 0, ?T => 0, ?C => 0, ?G => 0}
    assert FirstScripts.histogram('') == expected
  end

  #@tag :pending
  test "repetitive sequence has only guanine" do
    expected = %{?A => 0, ?T => 0, ?C => 0, ?G => 8}
    assert FirstScripts.histogram('GGGGGGGG') == expected
  end

  #@tag :pending
  test "counts all nucleotides" do
    s = 'AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC'
    expected = %{?A => 20, ?T => 21, ?C => 12, ?G => 17}
    assert FirstScripts.histogram(s) == expected
  end

  test "says hello with no name" do
    assert FirstScripts.hello() == "Hello, World!"
  end

  @tag :pending
  test "says hello sample name" do
    assert FirstScripts.hello("Alice") == "Hello, Alice!"
  end

  @tag :pending
  test "says hello other sample name" do
    assert FirstScripts.hello("Bob") == "Hello, Bob!"
  end
end
