class Robot
  attr_reader :position, :direction

  def initialize(position:, direction:)
    @position = position
    @direction = direction
  end

  def left
    Robot.new(position: position, direction: direction.left)
  end

  def right
    Robot.new(position: position, direction: direction.right)
  end

  def move
    Robot.new(position: position.move(direction), direction: direction)
  end

  def place(position:, direction:)
    Robot.new(position: position, direction: direction)
  end
end
