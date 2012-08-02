# bowling.rb
require_relative 'frame'
require 'ap'

class Bowling

  def initialize
    @frames  = []
    @spare = false
    @strike  = false
  end

  def hit(pins)
    f = current_frame
    f.add pins

    
    if @strike && f.finished?
      previous_frame.bonus = f.total
      @strike = false
    end

    if pins == 10
      @strike = true
    end
    
    if @spare
      previous_frame.bonus = pins
      @spare = false
    end
    
    # check for spare
    if f.total == 10
      @spare = true
    end
    
  end
  
  def score
    total = 0
    @frames.each do |f|
      total += f.total
    end

    total
  end

  private

  def current_frame
    if @frames.empty? || @frames.last.finished?
      @frames << Frame.new
    end

    # the last frame is always the frame we are on
    @frames.last
  end

  def previous_frame
    @frames[-2]
  end

end
