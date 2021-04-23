defmodule Mates.Operation do
  @enforce_keys [:a, :b, :operation]
  defstruct [:operation, a: 0, b: 0]
end

defimpl Inspect, for: Mates.Operation do
  def inspect(%Mates.Operation{a: a, b: b, operation: op}, _opts) do
    "#{a} #{op} #{b}"
    # 12 + 2
  end
end
