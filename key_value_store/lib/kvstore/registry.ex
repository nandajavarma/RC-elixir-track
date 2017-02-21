defmodule KVStore.Registry do
  use GenServer

  #Client API

  def lookup(server, name) do
    GenServer.call(server, {:lookup, name})
  end

  def start_link(name) do
    GenServer.start_link(__MODULE__, :ok, name: name)
  end

  def create(server, name) do
    GenServer.cast(server, {:create, name})
  end


  def stop(server) do
    GenServer.stop(server)
  end

  #Server Callbacks

  def init(:ok) do
    server = %{}
    refs = %{}
    {:ok, {server, refs}}
  end

  def handle_call({:lookup, name}, _from, {server, _} = state) do
    {:reply, Map.fetch(server, name), state}
  end

  def handle_cast({:create, name}, {server, refs}) do
    if Map.has_key?(server, name) do
      {:noreply, {server, refs}}
    else
      {:ok, bucket} = KVStore.Bucket.Supervisor.start_bucket
      server = Map.put(server, name, bucket)
      ref = Process.monitor(bucket)
      refs = Map.put(refs, ref, server)
      {:noreply, {server, refs}}
    end
  end

  def handle_info({:DOWN, ref, :process, _pid, _reason}, {server, refs}) do
    {state, refs} = Map.pop(refs, ref)
    [server] = for i <- state, do: Map.delete(server, elem(i, 0))
    {:noreply, {server, refs}}
  end

  def handle_info(_msg, state) do
    {:noreply, state}
  end
end
