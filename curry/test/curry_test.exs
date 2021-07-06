defmodule CurryTest do
  use ExUnit.Case
  doctest Curry

  test "greets the world" do
    assert Curry.hello() == :world
  end
end
