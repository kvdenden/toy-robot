RSpec.describe Table do
  let(:width) { 3 }
  let(:height) { 4 }
  subject(:table) { Table.new(width: width, height: height) }

  its(:width) { is_expected.to eq(width) }
  its(:height) { is_expected.to eq(height) }

  describe 'valid position?' do
    let(:x) { 0 }
    let(:y) { 0 }
    let(:position) { Position.new(x, y) }
    let(:valid?) { table.valid_position?(position) }

    context 'when on the table' do
      it 'returns true' do
        expect(valid?).to be_truthy
      end
    end

    context 'when x is smaller than 0' do
      let(:x) { -1 }
      it 'returns false' do
        expect(valid?).to be_falsey
      end
    end

    context 'when x is greater than width' do
      let(:x) { width + 1 }
      it 'returns false' do
        expect(valid?).to be_falsey
      end
    end

    context 'when x equals width' do
      let(:x) { width }
      it 'returns false' do
        expect(valid?).to be_falsey
      end
    end

    context 'when y is smaller than 0' do
      let(:y) { -1 }
      it 'returns false' do
        expect(valid?).to be_falsey
      end
    end

    context 'when y is greater than height' do
      let(:y) { height + 1 }
      it 'returns false' do
        expect(valid?).to be_falsey
      end
    end

    context 'when y equals height' do
      let(:y) { height }
      it 'returns false' do
        expect(valid?).to be_falsey
      end
    end
  end
end
