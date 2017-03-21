defmodule Temperex.WorkerTest do
  use ExUnit.Case
  doctest Temperex.Worker

  test "url_for returns the url for the location" do
    url = Temperex.Worker.url_for("New York")
    assert url == "http://api.openweathermap.org/data/2.5/weather?q=New%20York&appid=cbb24f361ae7b098f265351ec70b7fe6"
  end

  test "get the temperature of New York" do
    assert Temperex.Worker.temperature_of("New York")
  end

end
