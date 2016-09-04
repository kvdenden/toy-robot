RSpec.describe Position do
  let(:x) { 1 }
  let(:y) { 2 }
  subject(:position) { Position.new(x, y) }

  its(:x) { is_expected.to eq(x) }
  its(:y) { is_expected.to eq(y) }

  describe 'move' do
    let(:dx) { 1 }
    let(:dy) { -1 }
    let(:direction) { double(dx: dx, dy: dy) }
    let(:new_position) { position.move(direction) }

    it 'updates x coordinate' do
      expect(new_position.x).to eq(x + dx)
    end

    it 'updates y coordinate' do
      expect(new_position.y).to eq(y + dy)
    end
  end
end
