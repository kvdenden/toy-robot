class Parser
  def parse(str, world: nil)
    case str
    when /^LEFT$/
      Commands::Left.new(world: world)
    when /^RIGHT$/
      Commands::Right.new(world: world)
    when /^MOVE$/
      Commands::Move.new(world: world)
    when /^REPORT$/
      Commands::Report.new(world: world)
    when /^PLACE (?<x>\d+),(?<y>\d+),(?<dir>NORTH|EAST|SOUTH|WEST)$/
      x = $~[:x].to_i
      y = $~[:y].to_i
      dir = $~[:dir].downcase.to_sym
      Commands::Place.new(world: world, position: Position.new(x, y), direction: Direction.find(dir))
    end
  end
end
