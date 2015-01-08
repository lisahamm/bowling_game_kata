require 'spec_helper'
require 'bowling_game'

describe BowlingGame do
  let(:bowling_game) {BowlingGame.new}

  it "can score a gutter game" do
    20.times {bowling_game.roll(0)}
    expect(bowling_game.score).to eq 0
  end
end