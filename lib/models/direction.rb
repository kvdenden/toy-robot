class Direction
  attr_reader :dx, :dy

  def left
    Direction.left(self)
  end

  def right
    Direction.right(self)
  end

  private
  def initialize(name, dx: 0, dy: 0)
    @dx, @dy = dx, dy
  end

  class << self
    DIRECTIONS = {
      north: Direction.new("NORTH", dy: 1),
      east:  Direction.new("EAST", dx: -1),
      south: Direction.new("SOUTH", dy: -1),
      west:  Direction.new("WEST", dx: 1)
    }

    def north
      DIRECTIONS[:north]
    end

    def east
      DIRECTIONS[:east]
    end

    def south
      DIRECTIONS[:south]
    end

    def west
      DIRECTIONS[:west]
    end

    def left(dir)
      { north => east, east => south, south => west, west => north }.fetch(dir)
    end

    def right(dir)
      { north => west, west => south, south => east, east => north }.fetch(dir)
    end
  end
end
