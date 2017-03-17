defmodule Mp3ParserTest do
  use ExUnit.Case
  doctest Mp3Parser

  test "return enoent for invalid filename" do
    data = Mp3Parser.get_title_and_artist("")
    assert data == :enoent
  end

  test "return metadata for an mp3" do
    filename = Path.join(File.cwd!, "test/clojure.mp3")
    data = Mp3Parser.get_title_and_artist(filename)
    assert data == :enoent
  end
end
