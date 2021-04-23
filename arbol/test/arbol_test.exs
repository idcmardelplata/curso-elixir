defmodule ArbolTest do
  use ExUnit.Case
  doctest Arbol

  test "greets the world" do
    assert Arbol.hello() == "mundo"

    refute Arbol.hello() == :world
  end
end
