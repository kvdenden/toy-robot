require_relative 'base'

module Commands
  class Place < Commands::Base
    def call(position:, direction:)
      if world.table.valid_position?(position)
        World.new(table: world.table, robot: Robot.new(position: position, direction: direction))
      else
        world
      end
    end
  end
end
