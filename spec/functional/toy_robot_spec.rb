RSpec.describe ToyRobot do
  let(:input) { File.read("./spec/support/#{file}").split("\n") }
  subject(:game) { ToyRobot.new }

  # before { game.play!(*input) }

  describe 'example 1' do
    let(:file) { 'ex1.txt' }

    it 'gives right output' do
      expect { game.play!(*input) }.to output(/0,1,NORTH/).to_stdout
    end
  end

  describe 'example 2' do
    let(:file) { 'ex2.txt' }

    it 'gives right output' do
      expect { game.play!(*input) }.to output(/0,0,WEST/).to_stdout
    end
  end

  describe 'example 3' do
    let(:file) { 'ex3.txt' }

    it 'gives right output' do
      expect { game.play!(*input) }.to output(/3,3,NORTH/).to_stdout
    end
  end
end
