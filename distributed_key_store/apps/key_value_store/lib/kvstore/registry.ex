defmodule KVStore.Registry do
  use GenServer

  #Client API

  def lookup(server, name) do
    case :ets.lookup(server, name) do
      [{^name, pid}] -> {:ok, pid}
      [] -> :error
    end
  end

  def start_link(name) do
    GenServer.start_link(__MODULE__, name, name: name)
  end

  def create(server, name) do
    GenServer.call(server, {:create, name})
  end


  def stop(server) do
    GenServer.stop(server)
  end

  #Server Callbacks

  def init(table) do
    server = :ets.new(table, [:named_table, read_concurrency: true])
    refs = %{}
    {:ok, {server, refs}}
  end

  #We don't need this anymore since we are using ets
  #def handle_call({:lookup, name}, _from, {server, _} = state) do
    #{:reply, Map.fetch(server, name), state}
  #end

  #We use handle_call/3 to create entries to make it synchronous
  def handle_call({:create, name}, _from, {server, refs}) do
    case lookup(server, name) do
      {:ok, pid} -> {:reply, pid, {server, refs}}
      :error ->
        {:ok, bucket} = KVStore.Bucket.Supervisor.start_bucket
        ref = Process.monitor(bucket)
        :ets.insert(server, {name, bucket})
        refs = Map.put(refs, ref, server)
        {:reply, bucket, {server, refs}}
    end
  end
  #def handle_cast({:create, name}, {server, refs}) do
    #case lookup(server, name) do
      #{:ok, _pid} -> {:noreply, {server, refs}}
      #:error ->
        #{:ok, bucket} = KVStore.Bucket.Supervisor.start_bucket
        #ref = Process.monitor(bucket)
        #:ets.insert(server, {name, bucket})
        #refs = Map.put(refs, ref, server)
        #{:noreply, {server, refs}}
    #end
  #end

  def handle_info({:DOWN, ref, :process, _pid, _reason}, {server, refs}) do
    {state, refs} = Map.pop(refs, ref)
    :ets.delete(server, :ets.first(state))
    {:noreply, {server, refs}}
  end

  def handle_info(_msg, state) do
    {:noreply, state}
  end
end
