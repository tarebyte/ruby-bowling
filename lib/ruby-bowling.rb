require_relative 'ruby-bowling/bowling'

# if you are runnign this file with "ruby ruby-bowling.rb"
if __FILE__ == $0
  alexs_game = Bowling.new


  alexs_game.hit(10)
  alexs_game.hit(10)
  alexs_game.hit(10)
  alexs_game.hit(10)
  alexs_game.hit(10)
  alexs_game.hit(10)
  alexs_game.hit(10)
  alexs_game.hit(10)
  alexs_game.hit(10)
  alexs_game.hit(10)
  # bonus balls
  alexs_game.hit(10)
  alexs_game.hit(10)
  

  puts "Alex bowled #{alexs_game.score}"
end
