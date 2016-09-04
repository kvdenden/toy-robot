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

    def ==(other)
      other.class == self.class && other.state == state
    end

    protected

    def state
      [world]
    end
  end
end
