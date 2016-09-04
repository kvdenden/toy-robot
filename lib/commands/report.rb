module Commands
  class Report
    attr_reader :world
    def initialize(world:)
      @world = world
    end

    def call(out: STDOUT)
      out.puts "#{world.robot.x},#{world.robot.y},#{world.robot.direction}" if world.robot
      world
    end
  end
end
