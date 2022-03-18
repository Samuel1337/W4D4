class Player
    attr_reader :name, :amount, :hand
    def initialize(name, amount)
        @amount = amount
        @name = name 
        @hand = []
    end


end