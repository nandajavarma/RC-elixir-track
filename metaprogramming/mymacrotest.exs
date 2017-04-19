defmodule MyMacroTest do
  import Assertions
  def run do
    assert 1 == 1
    assert 1 == 5
  end
end

MyMacroTest.run()
