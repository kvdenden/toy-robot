RSpec.describe Commands::Right do
  let(:table) { Table.new }
  let(:world) { World.new(table: table, robot: robot) }
  subject(:right) { Commands::Right.new(world: world) }

  describe 'call' do
    context 'when robot is not placed' do
      let(:robot) { nil }
      it 'returns world unchanged' do
        expect(right.call).to eq(world)
      end
    end

    context 'when robot is placed' do
      let(:robot) { Robot.new(position: Position.new(1, 2), direction: Direction.east) }

      it 'returns world with robot rotated to the right' do
        expect(right.call.robot).to eq(robot.right)
      end

      context 'with different position and direction' do
        let(:robot) { Robot.new(position: Position.new(3, 4), direction: Direction.south) }

        it 'returns world with robot rotated to the right' do
          expect(right.call.robot).to eq(robot.right)
        end
      end
    end
  end
end
