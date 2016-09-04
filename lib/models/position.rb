class Position
  attr_reader :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end

  def move(dir)
    Position.new(x + dir.dx, y + dir.dy)
  end

  def ==(other)
    other.class == self.class && other.state == state
  end

  protected

  def state
    [x, y]
  end
end
