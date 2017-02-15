defmodule Bst do
  @moduledoc """
  Implementing Binary Search Tree operations in Elixir
  """

  @doc """
  Creates a new node
  """
  @spec new(any) :: %{}
  def new(value) do
    %{root: value, left: :leaf, right: :leaf}
  end


  @doc """
  Inserts new elements to a list
  """
  @spec insert(%{} | :leaf, any) :: %{}
  def insert(:leaf, value), do: new value

  def insert(%{root: root, left: left, right: right}, value) do
    if value < root do
      %{root: root, left: insert(left, value), right: right}
    else
      %{root: root, left: left, right: insert(right, value)}
    end
  end

  @spec delete_node(%{}, any) :: %{} | nil
  def delete_node(tree, node_value) do
    if map_size(tree) == 0 do
      nil
    else
      delete(tree, node_value)
    end
  end

  def delete(tree, value) do
    cond do
      tree.root == value -> del(tree)
      tree.root < value -> %{left: tree.left, root: tree.root, right: delete(tree.right, value)}
      tree.root > value -> %{left: delete(tree.left, value), root: tree.root, right: tree.right}
    end
  end

  defp del(%{left: :leaf, root: _, right: right}), do: right
  defp del(%{left: left, root: _, right: :leaf}), do: left
  defp del(%{left: left, root: _, right: right}) do
    %{left: left, root: min(right), right: delete(right, min(right))}
  end

  defp min(%{left: :leaf, root: val, right: _}), do: val
  defp min(%{left: left, root: _, right: _}), do: min left

  @spec dfs(%{} | :leaf, any) :: %{} | :leaf | nil
  def dfs(%{root: root, left: :leaf, right: :leaf}, item) do
    if root == item do
      item
    else
      nil
    end
  end

  def dfs(%{root: root, left: :leaf, right: right}, item) do
    if root == item do
      item
    else
      [root] ++ dfs(right, item)
    end
  end

  def dfs(%{root: root, left: left, right: :leaf}, item) do
    if root == item do
      item
    else
      [root] ++ dfs(left, item)
    end
  end

  def dfs(%{root: root, left: left, right: right}, item) do
    IO.inspect root
    if root == item do
      item
    else
      [root] ++ dfs(left, item) ++ dfs(right, item)
    end
  end

end
