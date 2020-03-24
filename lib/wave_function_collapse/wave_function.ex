defmodule WaveFunction do
  defstruct coefficients: [[]], weights: %{}

  def shannon_entropy(self, {x, y}) do
    {sum_of_weights, sum_of_logged_weights} =
      Enum.at(self.coefficients, y)
      |> Enum.at(x)
      |> Enum.reduce({0, 0}, fn x, acc ->
        weight = self.weights[x]
        {sum_of_weights, sum_of_logged_weights} = acc
        {sum_of_weights + weight, sum_of_logged_weights + (weight * :math.log(weight))}
      end)

      :math.log(sum_of_weights) - (sum_of_logged_weights/sum_of_weights)
  end
end
