defmodule WaveFunctionTest do
  use ExUnit.Case

  setup do
    wave_function = %WaveFunction{
      weights: %{"C" => 4, "L" => 14, "S" => 10},
      coefficients: [[["C", "L", "S"]], [["C", "L", "S"]]]
    }

    {:ok, wave_function: wave_function}
  end

  test "calculates correct entropy value", %{wave_function: wave_function} do
    assert WaveFunction.shannon_entropy(wave_function, {0, 1}, {0,0}) == 0.992281974852574
  end
end
