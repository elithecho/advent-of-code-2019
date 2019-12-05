defmodule Fuel do
  def from_mass(mass) do
    floor(mass / 3) - 2
  end

  def total(total, mass) when mass >= 0 do
    fuel = from_mass(mass)
    sum = total + max(0, fuel)

    total(sum, fuel)
  end

  def total(total, _mass), do: total

  def read_from_file(filename) do
    {:ok, file} = File.read(filename)

    file
    |> String.trim
    |> String.split("\n")
    |> Enum.map(&String.to_integer/1)
    |> Enum.map(fn x -> total(0, x) end)
    |> Enum.sum
  end
end
