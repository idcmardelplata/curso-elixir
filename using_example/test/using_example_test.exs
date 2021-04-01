defmodule UsingExampleTest do
  use ExUnit.Case
  doctest UsingExample

  test "greets the world" do
    assert UsingExample.hello() == :world
  end
end
