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

