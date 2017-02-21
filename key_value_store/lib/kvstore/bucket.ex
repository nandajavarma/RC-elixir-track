defmodule KVStore.Bucket do
  @doc """
  Starts a new bucket
  """
  def start_link do
    Agent.start_link(fn -> %{} end)
  end


  def get(list, key) do
    Agent.get(list, &Map.get(&1, key))
  end

  def put(list, key, value) do
    Agent.update(list, &Map.put(&1, key, value))
  end

  def delete(list, key) do
    Agent.get_and_update(list, &Map.pop(&1, key))
  end
end
