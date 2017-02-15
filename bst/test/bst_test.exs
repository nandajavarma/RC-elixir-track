defmodule BstTest do
  use ExUnit.Case
  doctest Bst

  @tree Bst.insert(Bst.insert(Bst.insert(Bst.insert(Bst.insert(Bst.insert(:leaf, 6),7),5),3),4),2)
  test "make sure the depth of the tree is right" do
    assert map_size(@tree) == 3
  end

  test "Delete the node 3" do
    refute (Bst.delete_node(@tree, 3)).left.left.root == 3
  end
end
