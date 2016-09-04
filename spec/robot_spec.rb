RSpec.describe Robot do
  let(:origin) { double('(0,0)') }
  let(:north) { double('NORTH') }
  subject(:robot) { Robot.new(position: origin, direction: north) }

  its(:position) { is_expected.to eq(origin) }
  its(:direction) { is_expected.to eq(north) }

  describe 'turning left' do
    let(:new_robot) { robot.left }
    let(:east) { double('EAST') }

    before { allow(north).to receive(:left).and_return(east) }

    it 'changes direction' do
      expect(new_robot.direction).to eq(east)
    end

    it 'keeps same position' do
      expect(new_robot.position).to eq(origin)
    end
  end

  describe 'turning right' do
    let(:new_robot) { robot.right }
    let(:west) { double('WEST') }

    before { allow(north).to receive(:right).and_return(west) }

    it 'changes direction' do
      expect(new_robot.direction).to eq(west)
    end

    it 'keeps same position' do
      expect(new_robot.position).to eq(origin)
    end
  end

  describe 'moving' do
    let(:new_robot) { robot.move }
    let(:new_position) { double('(0,1)') }

    before { allow(origin).to receive(:move).with(north).and_return(new_position) }

    it 'changes position' do
      expect(new_robot.position).to eq(new_position)
    end

    it 'keeps same direction' do
      expect(new_robot.direction).to eq(north)
    end
  end

  describe 'placing' do
    let(:new_position) { double('(2,3)') }
    let(:new_direction) { double('SOUTH') }
    let(:new_robot) { robot.place(position: new_position, direction: new_direction) }

    it 'sets direction' do
      expect(new_robot.direction).to eq(new_direction)
    end

    it 'sets position' do
      expect(new_robot.position).to eq(new_position)
    end
  end
end
