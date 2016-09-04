class Position
  attr_reader :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end

  def move(dir)
    Position.new(x + dir.dx, y + dir.dy)
  end
end
