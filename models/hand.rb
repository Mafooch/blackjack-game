require 'pry'
class Hand
  def initialize(hand_owner)
    @hand = []
    @hand_owner = hand_owner
  end

  attr_reader :hand_owner, :hand

  def add_to_hand(drawn_card)
    @hand << drawn_card
    puts "#{@hand_owner} was dealt #{drawn_card.rank}#{drawn_card.suit}"
  end

  def score
    aces = []
    score = 0
    @hand.each do |card|
      if card.face_card?
        score += 10
      elsif card.rank == "A"
        aces << card
      else
        score += card.rank.to_i
      end
    end

    aces.each do |ace|
      if (score + 11) <= 21
        score += 11
      else
        score += 1
      end
    end

    score
  end
end
