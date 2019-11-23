defmodule WaveFunctionCollapseTest do
  use ExUnit.Case

  setup do
    matrix = [
      ["L", "L", "L", "L"],
      ["L", "L", "L", "L"],
      ["L", "L", "L", "L"],
      ["L", "C", "C", "L"],
      ["C", "S", "S", "C"],
      ["S", "S", "S", "S"],
      ["S", "S", "S", "S"]
    ]

    compatibilities = [
      {"C", "C", {-1, 0}},
      {"L", "C", {0, 1}},
      {"S", "S", {1, 0}},
      {"C", "S", {-1, 0}},
      {"S", "S", {0, 1}},
      {"L", "L", {-1, 0}},
      {"L", "C", {-1, 0}},
      {"C", "L", {1, 0}},
      {"C", "L", {0, -1}}, #left
      {"S", "C", {0, -1}}, #left
      {"C", "S", {1, 0}},
      {"S", "S", {-1, 0}},
      {"S", "S", {0, -1}}, #left
      {"L", "C", {1, 0}},
      {"L", "L", {0, -1}}, #left
      {"L", "L", {0, 1}},
      {"S", "C", {-1, 0}},
      {"L", "L", {1, 0}},
      {"C", "C", {1, 0}},
      {"C", "L", {-1, 0}},
      {"C", "S", {0, 1}},
      {"S", "C", {1, 0}}
    ]

    {:ok, matrix: matrix, compatibilities: compatibilities}
  end

  test "checks weights are correct", %{matrix: matrix} do
    assert WaveFunctionCollapse.RuleSet.matrix_weights(matrix) == %{"C" => 4, "L" => 14, "S" => 10}
  end

  test "check compatibilities", %{matrix: matrix, compatibilities: compatibilities} do
    assert (WaveFunctionCollapse.RuleSet.matrix_compatibilities(matrix) -- compatibilities) == []
  end
end
