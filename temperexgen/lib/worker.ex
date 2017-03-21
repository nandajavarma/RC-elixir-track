defmodule Temperexgen.Worker do
  use GenServer

  # Client

  def start_link(name \\ "test", opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, opts ++ [name: name])
  end

  def get_temperature(name, location) do
    GenServer.call(name, {:location, location})
  end

  def get_state(name) do
    GenServer.call(name, :get_state)
  end

  def reset_state(name) do
    GenServer.cast(name, :reset_state)
  end

  def stop(name) do
    GenServer.cast(name, :stop)
  end


  # Server

  def init(:ok), do: {:ok, %{}}

  def handle_call(:get_state, _from, state) do
    {:reply, state, state}
  end

  def handle_call({:location, location}, _from, state) do
    case temperature_of(location) do
      {:ok, temp} ->
          new_state = update_state(state, location)
          {:reply, "#{temp}°C", new_state}
        _ ->  {:reply, :error, state}
    end
  end

  def handle_cast(:reset_state, _state) do
    {:noreply, %{}}
  end

  def handle_cast(:stop, state) do
    {:stop, :normal, state}
  end

  def handle_info(msg, state) do
    {:noreply, state}
  end

  def terminate(reason, state) do
    :ok
  end

  # Helpers

  defp apikey() do
    "cbb24f361ae7b098f265351ec70b7fe6"
  end

  def url_for(location) do
    location = URI.encode(location)
    "http://api.openweathermap.org/data/2.5/weather?q=#{location}&appid=#{apikey()}"
  end

  def get_temperature(json) do
    try do
      (json["main"]["temp"] - 273.15) |> Float.round(1)
    rescue
      _ -> :error
    end
  end
  def parse_it({:ok, %HTTPoison.Response{body: body, status_code: 200}}) do
    body |> JSON.decode! |> get_temperature
  end

  def parse_it(_), do: :error

  def temperature_of(location) do
    temp = url_for(location) |> HTTPoison.get |> parse_it
    {:ok, temp}
  end

  def update_state(state, location) do
    Map.update(state, location, 1, &(&1 + 1))
  end

end
