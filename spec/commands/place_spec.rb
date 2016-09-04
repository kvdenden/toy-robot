RSpec.describe Commands::Place do
  let(:world) { World.create }
  subject(:place) { Commands::Place.new(world: world, position: position, direction: direction) }

  describe 'call' do
    let(:position) { Position.new(0, 0) }
    let(:direction) { Direction.east }

    context 'when given a valid position' do
      let(:robot) { place.call.robot }

      it 'returns world with robot with given position' do
        expect(robot.position).to eq(position)
      end

      it 'returns world with robot with given direction' do
        expect(robot.direction).to eq(direction)
      end
    end

    context 'when given an invalid position' do
      let(:position) { Position.new(-1, -1) }

      it 'returns world unchanged' do
        expect(place.call).to eq(world)
      end
    end

    context 'when given an invalid direction' do
      let(:direction) { nil }

      it 'returns world unchanged' do
        expect(place.call).to eq(world)
      end
    end
  end
end
