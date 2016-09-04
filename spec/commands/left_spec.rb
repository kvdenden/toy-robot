RSpec.describe Commands::Left do
  let(:table) { Table.new }
  let(:world) { World.new(table: table, robot: robot) }
  subject(:left) { Commands::Left.new(world: world) }

  describe 'call' do
    context 'when robot is not placed' do
      let(:robot) { nil }
      it 'returns world unchanged' do
        expect(left.call).to eq(world)
      end
    end

    context 'when robot is placed' do
      let(:robot) { Robot.new(position: Position.new(1, 2), direction: Direction.east) }

      it 'returns world with robot rotated to the left' do
        expect(left.call.robot).to eq(robot.left)
      end

      context 'with different position and direction' do
        let(:robot) { Robot.new(position: Position.new(3, 4), direction: Direction.south) }

        it 'returns world with robot rotated to the left' do
          expect(left.call.robot).to eq(robot.left)
        end
      end
    end
  end
end
