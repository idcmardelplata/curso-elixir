defmodule Mates.Private do
  alias Mates.Operation

  def operar(%Operation{a: a, b: b, operation: ope}), do: ope.(a, b)
end
