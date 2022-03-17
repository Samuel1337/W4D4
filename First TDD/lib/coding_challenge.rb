require "byebug"

def my_uniq(array)
    arr = []
    array.each do |el|
        arr << el unless arr.include?(el)
    end
    arr
end

class Array

    def two_sum
        arr = []
        (0...self.length).each do |i|
            (i + 1...self.length).each do |j|

                 arr << [i,j] if self[i] + self[j] == 0
            end

        end
        arr
    end

end


def my_transpose(array)
    arr = Array.new(array.length) {Array.new(array[0].length)}
    array.each_with_index do |row,i|
        row.each_with_index do |el,j|
            
            arr[i][j] = array[j][i]
        end
    end
    arr
end

def stock_picker(array)
    min = array.min
    max = array.max
    min_idx = 0
    max_idx = 0
    (0...array.length).each do |i|
        (i+1...array.length).each do |j|
            min_idx = i if min == array[i]
            max_idx = j if max == array[j]
        end
    end
    [min_idx,max_idx]
end

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
        return stack1.peek.width >= stack2.peek.width if !stack1.empty?
        return false
    end

    def get_move
        system("clear")
        render
        puts "Pick up a disc (1,2,3):"
        first = gets.chomp
        puts "Place the disc down (1,2,3):"
        second = gets.chomp
        
        arr = [pile1,pile1]

        case first
    
        when '1'
            arr << pile1
        when '2'
            arr << pile2
        when '3'
            arr << pile3
        else
            puts "Invalid input"
            get_move
        end

        case second
    
        when '1'
            arr << pile1
        when '2'
            arr << pile2
        when '3'
            arr << pile3
        else
            puts "Invalid input"
            get_move
        end

        move(arr.first, arr.last)
    end

    def board_transpose
        symbol_board = board.map do |stack|
            stack.discs.map do |disc|
                disc.symbol
            end
        end
        
        queue = symbol_board.flatten   
        arr = Array.new(board.length) {Array.new(board.length)}
        j = board.length-1
        while j >= 0
            (0...board.length).each do |i|
                arr[i][j] = queue.pop
            end
            j -= 1
        end
        arr
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
        display_board = board_transpose
        
        display_board.each { |row| puts row.join(" ") } 
    end

    def play

        until won?
            get_move
        end
    end

    def won?
       if  pile3.discs[0] == 3 && pile3.discs[1] == 2 &&pile3.discs[2] == 1
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