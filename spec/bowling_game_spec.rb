require 'spec_helper'
require 'bowling_game'

describe BowlingGame do
  let(:bowling_game) {BowlingGame.new}

  def roll_many(n, pins_down)
    n.times {bowling_game.roll(pins_down)}
  end

  def roll_spare
    2.times {bowling_game.roll(5)}
  end

  def roll_strike
    bowling_game.roll(10)
  end

  it "can score a gutter game" do
    roll_many(20, 0)
    expect(bowling_game.score).to eq 0
  end

  it "can score a simple game" do
    roll_many(20, 1)
    expect(bowling_game.score).to eq 20
  end

  it "can score a game with a spare" do
    roll_spare
    roll_many(18, 1)
    expect(bowling_game.score).to eq 29
  end

  it "can score a game with a strike" do
    roll_strike
    roll_many(18, 1)
    expect(bowling_game.score).to eq 30
  end

  it "can score a game with a spare in the last frame" do
    roll_many(18, 1)
    roll_spare
    bowling_game.roll(1)
    expect(bowling_game.score).to eq 29
  end

  it "can score a game with a strike in the last frame" do
    roll_many(18, 1)
    roll_strike
    bowling_game.roll(1)
    bowling_game.roll(1)
    expect(bowling_game.score).to eq 30
  end
end