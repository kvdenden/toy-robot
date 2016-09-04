module Commands
  class Left
    attr_reader :world
    def initialize(world:)
      @world = world
    end
    def call
      if world.robot
        World.new(table: world.table, robot: world.robot.left)
      else
        world
      end
    end
  end
end
