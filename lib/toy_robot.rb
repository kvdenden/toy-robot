class ToyRobot
  attr_reader :world, :parser
  def initialize(world: World.create, parser: Parser.new)
    @world, @parser = world, parser
  end

  def play!(*args)
    @world = args.reduce(world) do |w, str|
      cmd = parser.parse(str, world: w)
      if cmd
        cmd.call
      else
        w
      end
    end
  end
end
