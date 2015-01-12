class BowlingGame
  def initialize
    @rolls = []
  end

  def roll(pins_down)
    @rolls << pins_down
  end

  def score
    total = 0
    frame_index = 0
    frame = 0
    while frame_index < @rolls.length-1
      if strike?(frame_index)
        total += 10 + @rolls[frame_index+1] + @rolls [frame_index+2]
        frame_index += 2 if frame == 9
        frame_index += 1
      elsif spare?(frame_index)
        total += 10 + @rolls [frame_index+2]
        frame_index += 2
      else
        total += @rolls[frame_index] + @rolls[frame_index+1]
        frame_index += 2
      end
      frame += 1
    end
    total
  end

  def strike?(frame_index)
    @rolls[frame_index] == 10
  end

  def spare?(frame_index)
    @rolls[frame_index] + @rolls[frame_index+1] == 10
  end
end