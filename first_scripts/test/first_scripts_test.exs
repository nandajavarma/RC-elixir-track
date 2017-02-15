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

  # @tag :pending
  test "age on Earth" do
    input = 1_000_000_000
    assert_in_delta 31.69, FirstScripts.age_on(:earth, input), 0.005
  end

  #@tag :pending
  test "age on Mercury" do
    input = 2_134_835_688
    assert_in_delta 67.65, FirstScripts.age_on(:earth, input), 0.005
    assert_in_delta 280.88, FirstScripts.age_on(:mercury, input), 0.005
  end

  #@tag :pending
  test "age on Venus" do
    input = 189_839_836
    assert_in_delta 6.02, FirstScripts.age_on(:earth, input), 0.005
    assert_in_delta 9.78, FirstScripts.age_on(:venus, input), 0.005
  end

  #@tag :pending
  test "age on Mars" do
    input = 2_329_871_239
    assert_in_delta 73.83, FirstScripts.age_on(:earth, input), 0.005
    assert_in_delta 39.25, FirstScripts.age_on(:mars, input), 0.005
  end

  #@tag :pending
  test "age on Jupiter" do
    input = 901_876_382
    assert_in_delta 28.58, FirstScripts.age_on(:earth, input), 0.005
    assert_in_delta 2.41, FirstScripts.age_on(:jupiter, input), 0.005
  end

  #@tag :pending
  test "age on Saturn" do
    input = 3_000_000_000
    assert_in_delta 95.06, FirstScripts.age_on(:earth, input), 0.005
    assert_in_delta 3.23, FirstScripts.age_on(:saturn, input), 0.005
  end

  #@tag :pending
  test "age on Uranus" do
    input = 3_210_123_456
    assert_in_delta 101.72, FirstScripts.age_on(:earth, input), 0.005
    assert_in_delta 1.21, FirstScripts.age_on(:uranus, input), 0.005
  end

  #@tag :pending
  test "age on Neptune" do
    input = 8_210_123_456
    assert_in_delta 260.16, FirstScripts.age_on(:earth, input), 0.005
    assert_in_delta 1.58, FirstScripts.age_on(:neptune, input), 0.005
  end

  @unsorted [13,4,1,9,2,3,10]
  test "test the array is sorted properly" do
    assert FirstScripts.sort(@unsorted) == [1,2,3,4,9,10,13]
  end
end
