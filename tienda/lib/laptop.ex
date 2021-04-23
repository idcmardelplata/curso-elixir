defmodule Laptop do
  @derive Computadora
  defstruct tipo: "Laptop", marca: "", modelo: "", serie: ""

  def new(marca \\ "Eurocase", modelo \\ "", serie \\ "", tipo \\ "Laptop") do
    %__MODULE__{marca: marca, modelo: modelo, serie: serie, tipo: tipo}
  end

  def update_lap() do
    "La laptop se esta actualizando"
  end
end
