class World
  class << self
    def create
      new(table: Table.new, robot: nil)
    end
  end
  attr_reader :table, :robot
  def initialize(table:, robot:)
    @table, @robot = table, robot
  end
end
