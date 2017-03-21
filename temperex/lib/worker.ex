defmodule Temperex.Worker do

  defp apikey() do
    "cbb24f361ae7b098f265351ec70b7fe6"
  end

  def url_for(location) do
    location = URI.encode(location)
    "http://api.openweathermap.org/data/2.5/weather?q=#{location}&appid=#{apikey()}"
  end

  def get_temperature(json) do
    try do
      temp = (json["main"]["temp"] - 273.15) |> Float.round(1)
      {:ok, temp}
    rescue
      _ -> :error
    end
  end
  def parse_it({:ok, %HTTPoison.Response{body: body, status_code: 200}}) do
    body |> JSON.decode! |> get_temperature
  end

  def parse_it(_), do: :error

  def temperature_of(location) do
    url_for(location) |> HTTPoison.get |> parse_it
  end

  def loop() do
    receive do
      {sender_pid, location} ->
        send(sender_pid, {:ok, temperature_of(location)})
        _ -> "No idea how to process this message"
    end
    loop()
  end
end
