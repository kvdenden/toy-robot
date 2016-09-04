module Commands
  class Base
    attr_reader :world
    def initialize(world:)
      @world = world
    end

    def call(**args)
      _call(args) || world
    end

    def _call(_)
    end
  end
end
