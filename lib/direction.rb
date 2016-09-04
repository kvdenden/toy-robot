class Direction
  def left
    Direction.left(self)
  end

  def right
    Direction.right(self)
  end

  private
  def initialize(*args)
  end

  class << self
    DIRECTIONS = {
      north: Direction.new("NORTH"),
      east: Direction.new("EAST"),
      south: Direction.new("SOUTH"),
      west: Direction.new("WEST")
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
