# frame.rb
class Frame

  attr_accessor :bonus
  
  def initialize
    @first = 0
    @second = 0
    @bonus = 0
    @frame_tracker = 0
  end

  def add(pins)
    if @frame_tracker == 0
      @first = pins
    elsif @frame_tracker == 1
      @second  = pins
    else
      raise "No third ball in bowling!"
    end
    @frame_tracker += 1
  end

  def finished?
    @frame_tracker >= 2 || @first == 10
  end
  
  def total 
    @first + @second + @bonus
  end

  def to_s
    "<Frame #{total} [#{@first}/#{@second}]>"
  end
end
