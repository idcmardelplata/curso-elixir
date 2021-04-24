defmodule SuperTest do
  use ExUnit.Case
  doctest Super

  test "greets the world" do
    assert Super.hello() == :world
  end
end
