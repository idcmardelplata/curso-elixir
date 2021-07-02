defmodule Calcu do
  require Tracer

  def sum(a,b), do: Tracer.show_trace(a + b)
end
