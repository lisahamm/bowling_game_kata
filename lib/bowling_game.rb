class BowlingGame
  def initialize
    @rolls = []
  end

  def roll(pins_down)
    @rolls << pins_down
  end

  def score
    total = 0
    i = 0
    while i < 20
      total += @rolls[i]
      i += 1
    end
    total
  end
end