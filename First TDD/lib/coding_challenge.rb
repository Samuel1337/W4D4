def my_uniq(array)
    arr = []
    array.each do |el|
        arr << el unless arr.include?(el)
    end
    arr
end