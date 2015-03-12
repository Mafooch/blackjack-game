require "pry"
require_relative 'models/card.rb'
require_relative 'models/deck.rb'
require_relative 'models/hand.rb'

@deck = Deck.new


@player_hand = Hand.new("player")
@dealer_hand = Hand.new("dealer")

def hit_stand

  puts "#{@player_hand.hand_owner} score: #{@player_hand.score}\n "

  if @player_hand.score > 21
    puts "Bust! Game over..."
  else
    print "Hit or stand (H/S): "
    decision = gets.chomp.upcase!
    if decision == "H"
      puts "#{decision}"
      @player_hand.add_to_hand(@deck.draw!)
      hit_stand
    elsif decision == "S"
      puts "#{decision}"
      2.times { @dealer_hand.add_to_hand(@deck.draw!) }
      dealer_move
    else
      puts "#{decision} is not a valid decision. Please choose again."
      hit_stand
    end
  end
end

def dealer_move
  puts "#{@dealer_hand.hand_owner} score: #{@dealer_hand.score}\n "

  if @dealer_hand.score > 21
    puts "You win!!"
  elsif @dealer_hand.score < 17
    @dealer_hand.add_to_hand(@deck.draw!)
    dealer_move
  else
    compare
  end
end

def compare
  if @player_hand.score > @dealer_hand.score
    puts "You win!!!"
  elsif @player_hand.score == @dealer_hand.score
    puts "You tied!!"
  else
    puts "You lose!!"
  end
end

puts "Feeling lucky punk?\n "
2.times { @player_hand.add_to_hand(@deck.draw!) }

hit_stand
