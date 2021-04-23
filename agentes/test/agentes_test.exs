defmodule AgentesTest do
  use ExUnit.Case
  doctest Agentes

  test "greets the world" do
    assert Agentes.hello() == :world
  end
end
