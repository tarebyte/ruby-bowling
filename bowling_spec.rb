# bowling_spec.rb
require_relative 'bowling'

describe Bowling, "#score" do
  it "returns 0 for all gutter game" do
    bowling = Bowling.new
    20.times { bowling.hit(0) }
    bowling.score.should eq(0)
  end
  it "returns 1 for one pin hit" do
    bowling = Bowling.new
    bowling.hit(1)
    bowling.score.should eq(1)
  end
  it "returns 50 for fifty pins hit" do
    bowling = Bowling.new
    10.times { bowling.hit(5) }
    bowling.score.should eq(70)
  end
  it "returns 70 for 10 4/3 pins hit" do
    bowling = Bowling.new
    10.times do
      bowling.hit(4)
      bowling.hit(3)
    end
    bowling.score.should eq(70)
  end
  it "returns 80 for 10 6/2 pins hit" do
    bowling = Bowling.new
    10.times do
      bowling.hit(6)
      bowling.hit(2)
    end
    bowling.score.should eq(80)
  end

  it "should correctly score a straightforward spare" do
    bowling = Bowling.new
    bowling.hit(8)  # first frame
    bowling.hit(2)
    bowling.hit(5)  # second frame

    # spare + spare bonus 1 + next frame score
    bowling.score.should eq(10 + (5) + 5)
  end

  it "should correctly score a gutter then spare" do
    bowling = Bowling.new
    bowling.hit(0)
    bowling.hit(10)  # first frame
    bowling.hit(4)

    # spare + spare bonus 1 + next frame score
    bowling.score.should eq(10 + (4) + 4)
  end

  it "should correctly score a simple strike followed by non-spare/non-strike" do
    bowling = Bowling.new
    bowling.hit(10)  # first frame
    bowling.hit(2)   # second frame
    bowling.hit(5)

    # strike + next ball + next ball + second frame
    bowling.score.should eq(10 + (2 + 5) + 2 + 5)
  end

    it "should correctly score a strike followed by spare" do
    bowling = Bowling.new
    bowling.hit(10) # first frame
    bowling.hit(5)  # second frame
    bowling.hit(5)
    bowling.hit(4)  # third frame

    # strike + next ball + next ball + spare + next ball + third frame
    bowling.score.should eq(10 + (5 + 5) + 10 + (4) + 4)
  end

  it "should correctly score of 4 strikes followed by a non-spare frame" do
    bowling = Bowling.new
    bowling.hit(10) # first frame
    bowling.hit(10) # second frame
    bowling.hit(10) # third frame
    bowling.hit(10) # fourth frame
    bowling.hit(4)  # fifth frame part 1
    bowling.hit(3)  # fifth frame part 2

    # strike + strike + strike + strike + fifth frame
    bowling.score.should eq((10 + 10 + 10) + (10 + 10 + 10) + (10 + 10 + 4) + (10 + 4 + 3) + (4 + 3))
  end
end
