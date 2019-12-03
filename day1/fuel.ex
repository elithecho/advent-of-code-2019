defmodule Fuel do
  def from_mass(mass) do
    mass / 3
    |> Float.floor
    |> (&(&1 - 2)).()
    |> trunc
  end

  def read_from_file(filename) do
    {:ok, file} = File.read(filename)

    file
    |> String.trim
    |> String.split("\n")
    |> Enum.map(&String.to_integer/1)
    |> Enum.map(&from_mass/1)
    |> Enum.sum
  end
end
