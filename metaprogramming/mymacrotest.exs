defmodule MyMacroTest do
  use Assertions
  test "my first macro" do
    assert 1 == 1
  end
  test "my second macro" do
    assert 1 == 5
  end
end

MyMacroTest.run()
