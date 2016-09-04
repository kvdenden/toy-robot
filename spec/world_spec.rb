RSpec.describe World do
  let(:table) { double('table') }
  let(:robot) { double('robot') }
  subject(:world) { World.new(table: table, robot: robot)}

  its(:table) { is_expected.to eq(table) }
  its(:robot) { is_expected.to eq(robot) }

  describe 'create' do
    subject(:world) { World.create }
    it 'creates world with 5x5 table' do
      expect(world.table.width).to eq(5)
      expect(world.table.height).to eq(5)
    end
    it 'has no robot' do
      expect(world.robot).to be_nil
    end
  end

end
