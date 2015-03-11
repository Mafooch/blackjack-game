require "pry"
require_relative 'models/card.rb'
require_relative 'models/deck.rb'
require_relative 'models/hand.rb'

DECK = Deck.new


PLAYER_HAND = Hand.new("player")
DEALER_HAND = Hand.new("dealer")




def hit_stand
  
  puts "#{PLAYER_HAND.hand_owner} score: #{PLAYER_HAND.score}\n "

  if PLAYER_HAND.score > 21
    puts "Bust! Game over..."
  else
    print "Hit or stand (H/S): "
    decision = gets.chomp.upcase!
    if decision == "H"
      puts "#{decision}"
      PLAYER_HAND.add_to_hand(DECK.draw!)
      hit_stand
    elsif decision == "S"
      puts "#{decision}"
      2.times { DEALER_HAND.add_to_hand(DECK.draw!) }
      dealer_move
    else
      puts "#{decision} is not a valid decision. Please choose again."
      hit_stand
    end
  end
end

def dealer_move
  puts "#{DEALER_HAND.hand_owner} score: #{DEALER_HAND.score}\n "

  if DEALER_HAND.score > 21
    puts "You win!!"
  elsif DEALER_HAND.score < 17
    DEALER_HAND.add_to_hand(DECK.draw!)
    dealer_move
  else
    compare
  end
end

def compare
  if PLAYER_HAND.score > DEALER_HAND.score
    puts "You win!!!"
  elsif PLAYER_HAND.score == DEALER_HAND.score
    puts "You tied!!"
  else
    puts "You lose!!"
  end
end

puts "Feeling lucky punk?\n "
2.times { PLAYER_HAND.add_to_hand(DECK.draw!) }

hit_stand
