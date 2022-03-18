require_relative "card"
class Deck
    SUITES = %w(hearts spades diamonds clubs)
    VALUES = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
    attr_reader :cards
    def initialize

       @cards = []

        VALUES.each do |value|
            SUITES.each do |suite|
            @cards << Card.new(value,suite)
            end
        end
        @cards.shuffle!

    end 

    def shuffle!
        @cards.shuffle!
    end

    def length
        @cards.length
    end

    def deal(num)
        hand = []
        num.times { hand << cards.pop }
        hand
    end
end