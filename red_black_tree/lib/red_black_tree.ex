defmodule RedBlackTree do

  defstruct value: 0, color: "red", lchild: nil, rchild: nil, parent: nil

  def new(value) do
    %RedBlackTree{value: value}
  end

  def create_tree(root \\ nil, values)

  def create_tree(nil, [head | tail]) do
    create_tree(insert(head), tail)
  end

  def create_tree(root, [head| tail]) do
    create_tree(insert(root, head), tail)
  end

  def create_tree(root, []) do
    root
  end

  def insert(value) do
    value |> new() |> Map.put(:color, "black")
  end

  def insert(nil, node) do
    new(node)
  end

  def insert(current_node, value) do
    case current_node.value < value do
      true -> Map.put(current_node, :rchild, insert(current_node.rchild, value))
      _ -> Map.put(current_node, :lchild, insert(current_node.lchild, value))
    end
  end

  def delete(nil, value) do
    nil
  end

  def delete(current_node, value) do
    if current_node.value == value do
      delete_node(current_node)
    else
       case current_node.value < value do
          true -> Map.put(current_node, :rchild, delete(current_node.rchild, value))
          _ -> Map.put(current_node, :lchild, delete(current_node.lchild, value))
       end
    end
  end

  defp get_min_rchild(node) do
    case node.lchild == nil do
      true -> node
      _ -> get_min_rchild(node.lchild)
    end
  end

  defp delete_node(%RedBlackTree{value: _, lchild: nil, rchild: nil, color: _}) do
    nil
  end

  defp delete_node(%RedBlackTree{value: _, lchild: lchild, rchild: nil, color: _}) do
    lchild
  end

  defp delete_node(%RedBlackTree{value: _, lchild: nil, rchild: rchild, color: _}) do
    rchild
  end

  defp delete_node(node) do
    min_child = get_min_rchild(node.rchild)
    node |> delete(min_child.value) |> Map.put(:value, min_child.value)
  end
end
