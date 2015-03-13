require 'pry'
require_relative "../../models/hand"
require_relative "../../models/card"

describe Hand do

  describe "#score" do
    context "when player has four aces" do
      my_hand = Hand.new("player")
      4.times do
        ace_card = PlayingCard.new("A","♠")
        my_hand.add_to_hand(ace_card)
      end

      it "returns a score of 14" do
        expect(my_hand.score).to eq 14
      end
    end

    context "when ace low is better" do
      my_hand = Hand.new("player")
      queen = PlayingCard.new("Q","♠")
      ace_card = PlayingCard.new("A","♠")
      king = PlayingCard.new("K","♠")
      cards = queen, ace_card, king
      cards.each do |card|
        my_hand.add_to_hand(card)
      end

      it "returns 21" do
        expect(my_hand.score).to eq 21
      end
    end

  end
end
