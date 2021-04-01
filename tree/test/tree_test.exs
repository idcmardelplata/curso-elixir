defmodule TreeTest do
  use ExUnit.Case
  doctest Tree

  test "greets the world" do
    assert Tree.hello() == :world
  end
end
