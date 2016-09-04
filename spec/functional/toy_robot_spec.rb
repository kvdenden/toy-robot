RSpec.describe ToyRobot do
  subject(:game) { ToyRobot.new }

  describe 'examples' do
    let(:input) { File.read("./spec/support/#{file}").lines }
    context 'example 1' do
      let(:file) { 'ex1.txt' }

      it 'gives right output' do
        expect { game.play!(*input) }.to output(/0,1,NORTH/).to_stdout
      end
    end

    context 'example 2' do
      let(:file) { 'ex2.txt' }

      it 'gives right output' do
        expect { game.play!(*input) }.to output(/0,0,WEST/).to_stdout
      end
    end

    context 'example 3' do
      let(:file) { 'ex3.txt' }

      it 'gives right output' do
        expect { game.play!(*input) }.to output(/3,3,NORTH/).to_stdout
      end
    end
  end

  context 'with invalid input' do
    let(:input) { ["PLACE 1,2,EAST", "MOVE", "FOO", "LEFT", "REPORT"] }
    it 'ignores the invalid input' do
      expect { game.play!(*input) }.to output(/2,2,NORTH/).to_stdout
    end
  end
end
