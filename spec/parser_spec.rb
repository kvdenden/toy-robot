RSpec.describe Parser do
  let(:world) { double('world') }
  subject(:parser) { Parser.new }

  describe 'parsing commands' do
    let(:command) { parser.parse(input, world: world) }

    context 'when input is LEFT' do
      let(:input) { 'LEFT' }
      let(:left) { Commands::Left.new(world: world) }

      it 'returns left command' do
        expect(command).to eq(left)
      end
    end

    context 'when input is RIGHT' do
      let(:input) { 'RIGHT' }
      let(:right) { Commands::Right.new(world: world) }

      it 'returns right command' do
        expect(command).to eq(right)
      end
    end

    context 'when input is MOVE' do
      let(:input) { 'MOVE' }
      let(:move) { Commands::Move.new(world: world) }

      it 'returns move command' do
        expect(command).to eq(move)
      end
    end

    context 'when input is REPORT' do
      let(:input) { 'REPORT' }
      let(:report) { Commands::Report.new(world: world) }

      it 'returns report command' do
        expect(command).to eq(report)
      end
    end

    context 'when input is PLACE X,Y,F' do
      let(:position) { Position.new(2, 3) }
      let(:direction) { Direction.west }
      let(:input) { "PLACE #{position.x},#{position.y},#{direction}" }
      let(:place) { Commands::Place.new(world: world, position: position, direction: direction) }

      it 'returns place command' do
        expect(command).to eq(place)
      end

      context 'with invalid position' do
        let(:input) { "PLACE x,y,#{direction}" }
        it 'returns nil' do
          expect(command).to be_nil
        end
      end

      context 'with invalid direction' do
        let(:input) { "PLACE #{position.x},#{position.y},UP" }
        it 'returns nil' do
          expect(command).to be_nil
        end
      end
    end

    context 'with invalid input' do
      let(:input) { 'FOO' }
      it 'returns nil' do
        expect(command).to be_nil
      end
    end
  end
end
