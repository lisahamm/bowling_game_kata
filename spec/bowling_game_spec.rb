require 'spec_helper'
require 'bowling_game'

describe BowlingGame do
  let(:bowling_game) {BowlingGame.new}

  it "can score a gutter game" do
    20.times {bowling_game.roll(0)}
    expect(bowling_game.score).to eq 0
  end

  it "can score a simple game" do
    20.times {bowling_game.roll(1)}
    expect(bowling_game.score).to eq 20
  end

  it "can score a game with a spare" do
    bowling_game.roll(5)
    bowling_game.roll(5)
    18.times {bowling_game.roll(1)}
    expect(bowling_game.score).to eq 29
  end

  it "can score a game with a strike" do
    bowling_game.roll(10)
    18.times {bowling_game.roll(1)}
    expect(bowling_game.score).to eq 30
  end
end