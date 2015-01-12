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
    while i < @rolls.length-1
      if @rolls[i] == 10
        total += @rolls[i] + @rolls[i+1] + @rolls [i+2]
        i += 1
      elsif @rolls[i] + @rolls[i+1] == 10
        total += @rolls[i] + @rolls[i+1] + @rolls [i+2]
        i += 2
      else
        total += @rolls[i] + @rolls[i+1]
        i += 2
      end
    end
    total
  end
end
