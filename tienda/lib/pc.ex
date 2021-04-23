defmodule PC do
  @derive Computadora
  defstruct tipo: "PC", marca: "", modelo: "", serie: ""

  def new(marca \\ "Eurocase", modelo \\ "", serie \\ "", tipo \\ "PC") do
    %__MODULE__{marca: marca, modelo: modelo, serie: serie, tipo: tipo}
  end

  def cambiar_mother(pc) do
    Computadora.encender(pc)
    # "el mother de la #{pc.tipo} fue cambiado"
  end
end
