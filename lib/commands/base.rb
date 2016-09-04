module Commands
  class Base
    attr_reader :world
    def initialize(world:)
      @world = world
    end

    def call(_)
      world
    end
  end
end
