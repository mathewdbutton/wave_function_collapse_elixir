defmodule WaveFunctionCollapse.RuleSet do
  alias WaveFunctionCollapse.MatrixTranspose

  @up {0, 1}
  @left {-1, 0}
  @down {0, -1}
  @right {1, 0}

  def matrix_weights(matrix) do
    List.flatten(matrix)
    |> Enum.reduce(%{}, fn x, acc -> Map.update(acc, x, 1, &(&1 + 1)) end)
  end

  def valid_move(move, move_list) do
    Enum.member?(move_list, move)
  end

  def calc_direction(matrix, direction) do
    Enum.map(matrix, fn x ->
      [current | rest] = x
      calc_line(current, rest, [], direction)
    end)
    |> List.flatten()
    |> Enum.uniq()
  end

  def matrix_compatibilities(matrix) do
    left = calc_direction(matrix, @right)

    right =
      Enum.map(matrix, &Enum.reverse/1)
      |> calc_direction(@left)

    up =
      MatrixTranspose.transpose(matrix)
      |> calc_direction(@up)

    down =
      MatrixTranspose.transpose(matrix)
      |> Enum.map(&Enum.reverse/1)
      |> calc_direction(@down)

    right ++ left ++ down ++ up
  end

  def calc_line(current, rest, acc, direction) when length(rest) > 0 do
    [new_current | new_rest] = rest

    if new_rest == nil do
      calc_line(
        new_current,
        new_rest,
        acc,
        direction
      )
    else
      calc_line(
        new_current,
        new_rest,
        [{current, List.first(rest), direction} | acc],
        direction
      )
    end
  end

  def calc_line(_, rest, acc, _) when length(rest) == 0 do
    acc
  end
end
