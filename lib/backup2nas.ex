defmodule Backup2nas do
  @moduledoc """
  Documentation for `Backup2nas`.
  """

  @doc """
  Hello world.

  ## Examples


  """
  def walk_directory(start_path) do
    walk_directory(start_path, [])
  end

  defp walk_directory(path, acc) do
    case File.ls(path) do
      {:ok, entries} ->
        directories =
          entries
          |> Enum.map(&Path.join(path, &1))
          |> Enum.filter(&File.dir?/1)

        # Recur on all subdirectories first (depth-first)
        Enum.reduce(directories, acc, fn dir, acc -> 
          walk_directory(dir, acc)
        end)
        # Finally, add the current directory to the accumulator
        |> Kernel.++([path])

      {:error, _reason} ->
        acc
    end
  end

end
