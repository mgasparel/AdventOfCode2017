defmodule Day03 do
  @moduledoc """
    You come across an experimental new kind of memory stored on an infinite 
    two-dimensional grid.

    Each square on the grid is allocated in a spiral pattern starting at a 
    location marked 1 and then counting up while spiraling outward. For 
    example, the first few squares are allocated like this:

    17  16  15  14  13
    18   5   4   3  12
    19   6   1   2  11
    20   7   8   9  10
    21  22  23---> ...

    While this is very space-efficient (no squares are skipped), requested data 
    must be carried back to square 1 (the location of the only access port for 
    this memory system) by programs that can only move up, down, left, or right.
    They always take the shortest path: the Manhattan Distance between the 
    location of the data and square 1.

    How many steps are required to carry the data from the square identified in 
    your puzzle input all the way to the access port?
  """

  def solve do
    {input, _} = Integer.parse(File.read!("day_03_01_input.txt"))

    inputSqrt = :math.sqrt(input)

    sideLength = Float.ceil(inputSqrt)
    prevSideLength = Float.floor(inputSqrt)

    areaPosition = input - (prevSideLength * prevSideLength)

    coordinates = getCoords(sideLength, areaPosition)

    distance = getDistanceFromOrigin(coordinates)

    IO.puts("distance: #{distance}")
  end

  def getDistanceFromOrigin(coordinates) do
    {x, y} = coordinates

    abs(x) + abs(y)
  end

  def getPositionOnSide(areaPosition, sideLength) when areaPosition > sideLength do
    areaPosition - sideLength
  end

  def getPositionOnSide(areaPosition, sideLength) when areaPosition <= sideLength do
    areaPosition
  end

  def getCoords(sideLength, areaPosition) do
    x = getX(sideLength, areaPosition)
    y = getY(sideLength)

    {x, y}
  end

  def getY(sideLength) do
    Float.floor(sideLength / 2)
  end

  def getX(sideLength, areaPosition) do
    xOrigin = getXOrigin(sideLength)

    sidePosition = getPositionOnSide(areaPosition, sideLength)

    sidePosition - xOrigin
  end

  def getXOrigin(sideLength) do
    Float.ceil(sideLength / 2)
  end

end
