RSpec.describe Direction do
  subject(:north) { Direction.north }
  subject(:east) { Direction.east }
  subject(:south) { Direction.south }
  subject(:west) { Direction.west }

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
