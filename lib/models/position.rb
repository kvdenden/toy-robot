class Position
  attr_reader :x, :y
  def initialize(x, y)
    @x, @y = x, y
  end

  def move(dir)
    Position.new(x + dir.dx, y + dir.dy)
  end
end
