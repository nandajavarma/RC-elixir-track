defmodule Server do
  require Logger
  @moduledoc """
  Documentation for Server.
  """

  @doc """
  """
  def accept(port) do
    {:ok, socket} = :gen_tcp.listen(port, [:binary, packet: :line, active: false, reuseaddr: true])
    Logger.info("Accepting connections at #{port}")
    loop_listener(socket)
  end

  defp loop_listener(socket) do
    {:ok, client} = :gen_tcp.accept(socket)
    {:ok, pid} = Task.Supervisor.start_child(Server.TaskSupervisor, fn -> server(client) end)
    :ok = :gen_tcp.controlling_process(client, pid)
    loop_listener(socket)
  end

  defp server(socket) do
    socket |> read_lines() |> write_lines(socket)
    server(socket)
  end

  defp read_lines(socket) do
    {:ok, data} = :gen_tcp.recv(socket, 0)
    data
  end

  defp write_lines(data, socket) do
    :gen_tcp.send(socket, data)
  end
end
