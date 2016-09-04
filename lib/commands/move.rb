require_relative 'base'

module Commands
  class Move < Commands::Base
    def _call(_)
      if world.robot
        new_robot = world.robot.move
        World.new(table: world.table, robot: new_robot) if world.table.valid_position?(new_robot.position)
      end
    end
  end
end
