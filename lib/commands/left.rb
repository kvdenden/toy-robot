require_relative 'base'

module Commands
  class Left < Commands::Base
    def _call(_)
      World.new(table: world.table, robot: world.robot.left) if world.robot
    end
  end
end
