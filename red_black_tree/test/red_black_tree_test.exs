defmodule RedBlackTreeTest do
  use ExUnit.Case
  doctest RedBlackTree

  test "create a new node" do
    node = RedBlackTree.new(5)
    assert node.value == 5
    assert node.color == "red"
    assert node.lchild == nil
    assert node.rchild == nil
    assert node.parent == nil
  end

  test "insert a node to an empty tree" do
    tree = RedBlackTree.insert(5)
    assert tree.value == 5
    assert tree.color == "black"
    assert tree.lchild == nil
    assert tree.rchild == nil
    assert tree.parent == nil
  end

  test "insert a node to a single node tree" do
    root = RedBlackTree.insert(5)
    root = RedBlackTree.insert(root, 10)
    assert root.rchild.value == 10
    root = RedBlackTree.insert(root, 4)
    assert root.lchild.value == 4
    root = RedBlackTree.insert(root, 3)
    assert root.lchild.lchild.value == 3
  end

  test "create a tree with the given values" do
    tree = RedBlackTree.create_tree([5,10,4,3])
    assert tree.rchild.value == 10
    assert tree.lchild.value == 4
    assert tree.lchild.lchild.value == 3
  end

  test "delete element from the tree" do
    tree = RedBlackTree.create_tree([5,10,4,3])
    deleted_tree = RedBlackTree.delete(tree, 10)
    assert deleted_tree.rchild == nil
    deleted_tree = RedBlackTree.delete(tree, 4)
    assert deleted_tree.lchild.value == 3
    deleted_tree = RedBlackTree.delete(tree, 5)
    assert deleted_tree.value == 10
  end

end
