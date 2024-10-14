require './tic_tac_toe.rb'

RSpec.describe "#initialize" do
  it "initialized an empty board" do
    game = Game.new
    expect(game.board).to eq(
      [
        [nil, nil, nil],
        [nil, nil, nil],
        [nil, nil, nil]
      ]
    )
  end

  it "initialized an empty histry arr" do
    game = Game.new
    expect(game.history).to eq([])
  end
end

RSpec.describe "#make_move" do
  it "initialized an empty board" do
    game = Game.new

    game.make_move(1,1,'X')

  end
end