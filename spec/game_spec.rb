require './Classes/game'

describe Game do 
  before do
    @game = Game.new(true, 1990, 1985)
  end

  it 'Should return an instance of Game' do
    expect(@game).to be_instance_of Game
  end
end