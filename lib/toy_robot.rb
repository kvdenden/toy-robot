class ToyRobot
  attr_reader :world, :parser
  def initialize(world: World.create, parser: Parser.new)
    @world, @parser = world, parser
  end

  def play!(*args)
    @world = args.reduce(world) do |w, str|
      parser.parse(str, world: w).call
    end
  end
end
