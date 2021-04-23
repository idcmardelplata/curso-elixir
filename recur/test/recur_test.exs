defmodule RecurTest do
  use ExUnit.Case
  doctest Recur

  test "greets the world" do
    assert Recur.hello() == :world
  end
end
