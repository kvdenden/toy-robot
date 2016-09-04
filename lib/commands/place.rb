require_relative 'base'

module Commands
  class Place < Commands::Base
    attr_reader :position, :direction
    def initialize(world:, position:, direction:)
      @position = position
      @direction = direction
      super(world: world)
    end

    def _call(_)
      if world.table.valid_position?(position) && direction
        World.new(table: world.table, robot: Robot.new(position: position, direction: direction))
      end
    end

    protected

    def state
      super + [position, direction]
    end
  end
end
