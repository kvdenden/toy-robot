RSpec.describe Commands::Report do
  let(:table) { Table.new }
  let(:robot) { nil }
  let(:world) { World.new(table: table, robot: robot) }
  subject(:report) { Commands::Report.new(world: world) }

  describe 'call' do
    it 'returns world unchanged' do
      expect(report.call).to eq(world)
    end

    context 'when robot is placed' do
      let(:stdout) { double(puts: nil) }
      let(:robot) { Robot.new(position: Position.new(1, 2), direction: Direction.east) }

      it 'prints out location and direction of robot' do
        report.call(out: stdout)
        expect(stdout).to have_received(:puts).with('1,2,EAST')
      end

      context 'with different position and direction' do
        let(:robot) { Robot.new(position: Position.new(3, 4), direction: Direction.south) }

        it 'prints out location and direction of robot' do
          report.call(out: stdout)
          expect(stdout).to have_received(:puts).with('3,4,SOUTH')
        end
      end
    end
  end
end
