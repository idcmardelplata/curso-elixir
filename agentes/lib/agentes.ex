defmodule Agentes do
  use Agent

  @name __MODULE__

  def start_link(initial) do
    Agent.start_link(fn -> initial end, name: @name)
  end

  def inc(val) do
    Agent.update(@name, fn state -> state + val end)
  end

  def get() do
    Agent.get(@name, &Function.identity/1)
  end
end
