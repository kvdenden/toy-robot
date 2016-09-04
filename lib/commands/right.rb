require_relative 'base'

module Commands
  class Right < Commands::Base
    def call
      if world.robot
        World.new(table: world.table, robot: world.robot.right)
      else
        world
      end
    end
  end
end
