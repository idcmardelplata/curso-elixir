defmodule BasicServerTest do
  use ExUnit.Case
  doctest BasicServer

  test "greets the world" do
    assert BasicServer.hello() == :world
  end
end
