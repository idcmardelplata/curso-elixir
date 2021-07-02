defmodule MacrosTest do
  use ExUnit.Case
  doctest Macros

  test "greets the world" do
    assert Macros.hello() == :world
  end
end
