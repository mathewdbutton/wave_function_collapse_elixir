defmodule WaveFunctionCollapse.Coefficient do
  def populate(values, {width, height}) do
    List.duplicate(values, width)
    |> List.duplicate(height)
  end
end
