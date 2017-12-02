defmodule Day01_02 do
  @moduledoc """
  You notice a progress bar that jumps to 50% completion. Apparently, the door 
  isn't yet satisfied, but it did emit a star as encouragement. The instructions
  change:

  Now, instead of considering the next digit, it wants you to consider the digit
  halfway around the circular list. That is, if your list contains 10 items, 
  only include a digit in your sum if the digit 10/2 = 5 steps forward matches 
  it. Fortunately, your list has an even number of elements.
  """

  def getCharList(input) do
    String.graphemes(input)
  end

  def solve do
    {:ok, input} = File.read("day_01_02_input.txt")

    values = Enum.map(getCharList(input), fn(x) -> String.to_integer(x) end)

    halfLength = length(values) / 2 |> round #coerce integer

    [firstHalf, secondHalf] = Enum.chunk(values, halfLength)

    sumLikeDigits(firstHalf, secondHalf, 0)
  end

  def sumLikeDigits(firstHalf, secondHalf, sum) when length(firstHalf) > 0 do
    [fDigit | ftail] = firstHalf
    [sDigit | stail] = secondHalf

    if fDigit == sDigit do
      sumLikeDigits(ftail, stail, sum + fhead)
    else
      sumLikeDigits(ftail, stail, sum)
    end
  end

  def sumLikeDigits(first, second, sum) do
    IO.puts(sum * 2)
  end

end
