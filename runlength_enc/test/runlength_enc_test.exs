defmodule RunlengthEncTest do
  use ExUnit.Case
  doctest RunlengthEnc

  test "get encoding" do
    assert RunlengthEnc.encode("") == ""
    assert RunlengthEnc.encode("wwwbbb") == "3w3b"
    assert RunlengthEnc.encode("WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWBWWWWWWWWWWWWWW") == "12W1B12W3B24W1B14W"
  end
end
