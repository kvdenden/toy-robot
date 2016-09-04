RSpec.describe Commands::Move do
  let(:table) { Table.new }
  let(:world) { World.new(table: table, robot: robot) }
  subject(:move) { Commands::Move.new(world: world) }

  describe 'call' do
    context 'when robot is not placed' do
      let(:robot) { nil }
      it 'returns world unchanged' do
        expect(move.call).to eq(world)
      end
    end

    context 'when robot is placed' do
      let(:robot) { Robot.new(position: Position.new(1, 2), direction: Direction.east) }

      it 'returns world with robot moved forward' do
        expect(move.call.robot).to eq(robot.move)
      end

      context 'and facing the edge of the table' do
        let(:robot) { Robot.new(position: Position.new(0, 0), direction: Direction.south) }

        it 'returns world unchanged' do
          expect(move.call).to eq(world)
        end
      end
    end
  end
end
