defmodule CoefficientTest do
  use ExUnit.Case

  setup do
    result = [[[1,2],[1,2],[1,2]],[[1,2],[1,2],[1,2]]]
    {:ok, result: result}
  end

  test "populates possible values correctly", %{result: result} do
    assert WaveFunctionCollapse.Coefficient.populate([1,2],{3,2}) == result
  end
end
