defmodule Day02 do
  @moduledoc """
    "Based on what we're seeing, it looks like all the User wanted is some 
    information about the evenly divisible values in the spreadsheet. 
    Unfortunately, none of us are equipped for that kind of calculation - most 
    of us specialize in bitwise operations."

    It sounds like the goal is to find the only two numbers in each row where 
    one evenly divides the other - that is, where the result of the division 
    operation is a whole number. They would like you to find those numbers on 
    each line, divide them, and add up each line's result.
  """

  def solve do
    checksum = File.read!("day_02_02_input.txt")
        |> String.split("\r\n", trim: true)
        |> Enum.reduce(0, fn(line, sum) -> getLineChecksum(line) + sum end)

    IO.puts("File checksum: #{checksum}")
  end

  def getLineChecksum(line) do
    values = String.split(line, "\t", trim: true)
        |> Enum.map(&String.to_integer(&1))

    Enum.reduce(values, 0, fn(val, sum) -> processVal(val, values) + sum end)
  end

  def processVal(value1, list) do
    Enum.reduce(list, 0, fn(value2, sum) -> divideEvens(value1, value2) + sum end)
  end

  def divideEvens(value1, value2) do
    #don't divide by self, and skip any values that don't divide evenly
    if value1 == value2 or rem(value1, value2) != 0 do
      0
    else
      div(value1, value2)
    end
  end

end
