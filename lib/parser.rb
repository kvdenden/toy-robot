class Parser
  class << self
    private

    def place(world, args)
      x = args[:x].to_i
      y = args[:y].to_i
      dir = args[:dir].downcase.to_sym
      Commands::Place.new(world: world, position: Position.new(x, y), direction: Direction.find(dir))
    end
  end

  MATCHERS = {
    /^LEFT$/ => ->(world, _) { Commands::Left.new(world: world) },
    /^RIGHT$/ => ->(world, _) { Commands::Right.new(world: world) },
    /^MOVE$/ => ->(world, _) { Commands::Move.new(world: world) },
    /^REPORT$/ => ->(world, _) { Commands::Report.new(world: world) },
    /^PLACE (?<x>\d+),(?<y>\d+),(?<dir>NORTH|EAST|SOUTH|WEST)$/ => ->(world, args) { place(world, args) }
  }.freeze

  def parse(str, world: nil)
    MATCHERS.map do |regex, f|
      match = regex.match(str)
      f.call(world, match) if match
    end.compact.first
  end
end
