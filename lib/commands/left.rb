require_relative 'base'

module Commands
  class Left < Commands::Base
    def call
      if world.robot
        World.new(table: world.table, robot: world.robot.left)
      else
        world
      end
    end
  end
end
