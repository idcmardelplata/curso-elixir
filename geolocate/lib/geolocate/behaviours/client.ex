defmodule ClientBehaviour do
  @callback get(query :: String.t()) :: Dict.t()
end
