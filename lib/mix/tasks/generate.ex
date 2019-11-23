defmodule Mix.Tasks.Generate do
  use Mix.Task
  def run(_), do: WaveFunctionCollapse.CLI.Main.main()
end
