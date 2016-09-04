require_relative 'base'

module Commands
  class Report < Commands::Base
    def _call(out: STDOUT)
      out.puts "#{world.robot.x},#{world.robot.y},#{world.robot.direction}" if world.robot
    end
  end
end
