# CLINT THACKER
# CHI Nighthawks

require_relative 'password'

describe PassWord do
  let(:game) {PassWord.new}

  it "sets board to blank" do
    game.target_word = "mississippi"
    expect(game.set_board).to eq "_ _ _ _ _ _ _ _ _ _ _"
  end


  it "checks to see if target word contains letter" do
    game.target_word = "mississippi"
    expect(game.check_letter('q')).to eq false
    expect(game.check_letter('i')).to eq true

  end

  it "updates current board with correct guess" do
    game.target_word = "mississippi"
    game.set_board
    expect(game.change_board('s')).to eq ['_', '_', 's', 's', '_', 's', 's', '_', '_', '_', '_']
  end

end