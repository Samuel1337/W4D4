class TowerOfHanoi

    attr_accessor :pile1, :pile2, :pile3, :board

    def initialize
        @pile1 = Stack.new( Disc.new(3), Disc.new(2), Disc.new(1) )
        @pile2 = Stack.new
        @pile3 = Stack.new
        @board = [@pile1, @pile2, @pile3]
    end

    def valid?(stack1,stack2)
        return true if !stack1.empty? && stack2.empty?
        return stack1.peek.width <= stack2.peek.width if !stack1.empty?
        return false
    end

    def get_move
        system("clear")
        render
        puts "Pick up a disc (1,2,3):"
        first = gets.chomp
        puts "Place the disc down (1,2,3):"
        second = gets.chomp
        
        arr = []

        case first
    
            when '1'
                arr << pile1
                puts "picked up from 1"
            when '2'
                arr << pile2
                puts "picked up from 2"
            when '3'
                arr << pile3
                puts "picked up from 3"
            else
                puts "Invalid input"
                get_move
        end

        case second
    
            when '1'
                arr << pile1
                puts "placed on 1"
            when '2'
                arr << pile2
                puts "placed on 2"
            when '3'
                arr << pile3
                puts "placed on 3"
            else
                puts "Invalid input"
                get_move
        end

        move(arr.first, arr.last)
    end  

    def move(stack1,stack2)
        if valid?(stack1,stack2)
            stack2.push(stack1.pop)
        else
            puts "Invalid move"
            get_move
        end
    end

    def render
         
        
         display_board = board.map do |row| 
            
            row.discs.map do |disc|

                disc.symbol
            end
        end
        display_board.each {|row| puts row.join(" ")}
    end

    def play

        until won?
            get_move
        end
    end

    def won?
        if pile3.length == 3
            render
            puts "Well Done!"
            return true
        end
        false
    end
end

class Stack

    attr_accessor :stack, :discs

    def initialize(*discs)
        @stack = Array.new
        @discs = discs || []
    end

    def push(ele)
        discs.push(ele)
        nil
    end

    def pop
        discs.pop
    end

    def peek
        discs.last
    end

    def empty?
       discs.empty?
    end

    def length
        discs.length
    end

    def display
        discs.map { |disc| disc.symbol }
    end
end

class Disc 

    attr_reader :width

    def initialize(width)
        @width = width
    end

    def symbol
        width.to_s
    end
end


game = TowerOfHanoi.new()
game.play