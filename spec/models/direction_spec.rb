RSpec.describe Direction do
  let(:north) { Direction.north }
  let(:east) { Direction.east }
  let(:south) { Direction.south }
  let(:west) { Direction.west }

  describe 'north' do
    subject { north }
    its(:dx) { is_expected.to eq(0) }
    its(:dy) { is_expected.to eq(1) }
    its(:to_s) { is_expected.to eq('NORTH') }
  end

  describe 'east' do
    subject { east }
    its(:dx) { is_expected.to eq(-1) }
    its(:dy) { is_expected.to eq(0) }
    its(:to_s) { is_expected.to eq('EAST') }
  end

  describe 'south' do
    subject { south }
    its(:dx) { is_expected.to eq(0) }
    its(:dy) { is_expected.to eq(-1) }
    its(:to_s) { is_expected.to eq('SOUTH') }
  end

  describe 'west' do
    subject { west }
    its(:dx) { is_expected.to eq(1) }
    its(:dy) { is_expected.to eq(0) }
    its(:to_s) { is_expected.to eq('WEST') }
  end

  describe 'turning left' do
    it 'turns from north to east' do
      expect(north.left).to eq(east)
    end

    it 'turns from east to south' do
      expect(east.left).to eq(south)
    end

    it 'turns from south to west' do
      expect(south.left).to eq(west)
    end

    it 'turns from west to north' do
      expect(west.left).to eq(north)
    end
  end

  describe 'turning right' do
    it 'turns from north to west' do
      expect(north.right).to eq(west)
    end

    it 'turns from west to south' do
      expect(west.right).to eq(south)
    end

    it 'turns from south to east' do
      expect(south.right).to eq(east)
    end

    it 'turns from east to north' do
      expect(east.right).to eq(north)
    end
  end
end
