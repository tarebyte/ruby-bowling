require_relative '../lib/ruby-bowling/frame'

describe Frame, "#total" do

  it "should have score of 9 if 5/4" do
    frame = Frame.new
    frame.add(5)
    frame.add(4)
    frame.total.should eq(9)
  end
  
  it "should calculate score of 15 for 5/5 with bonus of 5" do
    frame = Frame.new
    frame.add(5)
    frame.add(5)
    frame.bonus = 5
    frame.total.should eq(15)
  end

  it "should be done if two throws have been done" do
    frame = Frame.new
    frame.add(5)
    frame.add(4)
    frame.finished?.should eq(true)
  end

  it "should not be done one ball was thrown" do
    frame = Frame.new
    frame.add(5)
    frame.finished?.should eq(false)
  end

  it "should be finished if a strike is thrown" do
    frame = Frame.new
    frame.add(10)
    frame.finished?.should eq(true)
  end
  
end
