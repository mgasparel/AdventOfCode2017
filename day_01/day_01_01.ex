defmodule Day01 do
  @moduledoc """
  You're standing in a room with "digitization quarantine" written in LEDs along
  one wall. The only door is locked, but it includes a small interface. 
  "Restricted Area - Strictly No Digitized Users Allowed."

  It goes on to explain that you may only leave by solving a captcha to prove 
  you're not a human. Apparently, you only get one millisecond to solve the 
  captcha: too fast for a normal human, but it feels like hours to you.

  The captcha requires you to review a sequence of digits (your puzzle input) 
  and find the sum of all digits that match the next digit in the list. The list
  is circular, so the digit after the last digit is the first digit in the list.
  """

  def processList(value, remainingValues, first, sum) when length(remainingValues) > 0 do
    [head | tail] = remainingValues

    if value == head do
      processList(head, tail, first, sum + value)
    else
      processList(head, tail, first, sum)
    end
  end

  def processList(value, remainingValues, first, sum) do
    if value == first do
      IO.puts(sum + first)
    else
      IO.puts(sum)
    end
  end

  def getCharList(input) do
    String.graphemes(input)
  end

  def solve do
    {:ok, input} = File.read("day_01_01_input.txt")

    values = Enum.map(getCharList(input), fn(x) -> String.to_integer(x) end)

    [head | tail] = values

    processList(head, tail, head, 0)
  end

end
