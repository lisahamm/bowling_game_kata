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
    while frame < 10
      if strike?(frame_index)
        total += 10 + strike_bonus(frame_index)
        frame_index += 1
      elsif spare?(frame_index)
        total += 10 + spare_bonus(frame_index)
        frame_index += 2
      else
        total += sum_of_balls_in_frame(frame_index)
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

  def sum_of_balls_in_frame(frame_index)
    @rolls[frame_index] + @rolls[frame_index+1]
  end

  def spare_bonus(frame_index)
    @rolls[frame_index + 2]
  end

  def strike_bonus(frame_index)
    @rolls[frame_index+1] + @rolls[frame_index+2]
  end
end