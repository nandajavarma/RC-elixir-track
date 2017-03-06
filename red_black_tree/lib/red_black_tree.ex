defmodule RedBlackTree do

  defstruct value: 0, color: "red", lchild: nil, rchild: nil, parent: nil

  defp is_parent?(parent, value) do
    if parent.lchild == value or parent.rchild == value, do: true
  end
  defp is_grandchild(parents, value) do
    Enum.any?(parents, fn(p) -> is_parent?(p, value) == true end)
  end

  defp get_color("red"), do: "black"
  defp get_color("black"), do: "red"

  defp recolor(nil), do: nil

  defp recolor(node) do
    Map.put(node, :color, get_color(node.color))
  end

  defp recolor_gran(gran) do
    gran |>
      recolor |>
            Map.put(:lchild, recolor(gran.lchild)) |>
                  Map.put(:rchild, recolor(gran.rchild))
  end

  defp left_rotate(node) do
    Map.put(node.child, :lchild, Map.put(node, :rchild, node.child.lchild))
  end

  defp right_rotate(node) do
    Map.put(node.child, :rchild, Map.put(node, :lchild, node.child.rchild))
  end

  defp rotate(node) do
    if (node.lchild == nil or node.lchild.color == "black") do
      left_rotate(node)
    else
      right_rotate(node)
    end
  end

  defp rotate_and_recolor(gran) do
    gran |>
      recolor_gran |>
          rotate
  end

  defp do_balance_op(gran, nil) do
    rotate_and_recolor(gran)
  end

  defp do_balance_op(gran, uncle) do
    case uncle.color == "red" do
      true -> recolor_gran(gran)
      _ -> rotate_and_recolor(gran)
    end
  end

  defp rbtbalance(gran, value) do
    case is_grandchild([gran.lchild, gran.rchild], value) do
      true -> case is_parent?(gran.lchild, value) do
                true -> do_balance_op(gran, gran.rchild)
                 _ -> do_balance_op(gran, gran.lchild)
              end
      _ ->    Map.put(gran, :lchild, rbtbalance(gran.lchild, value))
              Map.put(gran, :rchild, rbtbalance(gran.rchild, value))
    end
  end

  defp red_violation(node, truth \\ false)
  defp red_violation(nil, t), do: t

  defp red_violation(node, truth) do
    red_violation(node.lchild, redness_check(node, node.lchild) or truth) or red_violation(node.rchild, redness_check(node, node.rchild) or truth)
  end

  defp redness_check("red", "red"), do: true
  defp redness_check(_, _), do: false

  defp balance(root, node) do
    case red_violation(root) do
      true -> rbtbalance(root, node)
      false -> root
    end
  end

  defp black_root?(root) do
    case root.color == "red" do
      true -> Map.put(root, :color, "black")
      _ -> root
    end
  end
  # The BST bit

  def new(value) do
    %RedBlackTree{value: value}
  end

  def create_tree(root \\ nil, values)

  def create_tree(nil, [head | tail]) do
    create_tree(insert(head), tail)
  end

  def create_tree(root, [head| tail]) do
    root |>
      insert(head) |>
        balance(head) |>
            black_root? |>
              create_tree(tail)
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

  def delete(nil, _value), do: nil

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
