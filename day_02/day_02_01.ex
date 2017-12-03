defmodule Day02 do
  @moduledoc """
    As you walk through the door, a glowing humanoid shape yells in your 
    direction. "You there! Your state appears to be idle. Come help us repair 
    the corruption in this spreadsheet - if we take another millisecond, we'll 
    have to display an hourglass cursor!"

    The spreadsheet consists of rows of apparently-random numbers. To make sure 
    the recovery process is on the right track, they need you to calculate the 
    spreadsheet's checksum. For each row, determine the difference between the 
    largest value and the smallest value; the checksum is the sum of all of 
    these differences.
  """

  def solve do
    checksum = File.read!("day_02_01_input.txt")
        |> String.split("\r\n", trim: true)
        |> Enum.reduce(0, fn(line, sum) -> getLineChecksum(line) + sum end)

    IO.puts("File checksum: #{checksum}")
  end

  def getLineChecksum(line) do
    values = String.split(line, "\t", trim: true)
        |> Enum.map(&String.to_integer(&1))

    Enum.max(values) - Enum.min(values)
  end

end
