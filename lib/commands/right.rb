require_relative 'base'

module Commands
  class Right < Commands::Base
    def _call(_)
      World.new(table: world.table, robot: world.robot.right) if world.robot
    end
  end
end
