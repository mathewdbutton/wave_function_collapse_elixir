defmodule WaveFunctionCollapse.CLI.Main do
  def main() do
    input_matrix = [
      ["L", "L", "L", "L"],
      ["L", "L", "L", "L"],
      ["L", "L", "L", "L"],
      ["L", "C", "C", "L"],
      ["C", "S", "S", "C"],
      ["S", "S", "S", "S"],
      ["S", "S", "S", "S"]
    ]

    weights = WaveFunctionCollapse.RuleSet.matrix_weights(input_matrix)
    rules = WaveFunctionCollapse.RuleSet.matrix_compatibilities(input_matrix)

    coefficients = WaveFunctionCollapse.Coefficient.populate(Map.keys(weights), {10, 50} )
    Mix.Shell.IO.info(coefficients)
  end
end
