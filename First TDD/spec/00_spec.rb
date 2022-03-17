require "rspec"
require "coding_challenge"

describe "#my_uniq" do
    it "uniq removes duplicates from an array" do
        expect(my_uniq([1,2,1,3,3]) ).to eq([1,2,3])
    end
end

describe "#two_sum" do

    it "return the indicies of all possible pairs whose sum is zero" do
        expect([-1,0,2,-2,1].two_sum).to eq([[0,4],[2,3]])  
    end
end
describe "#my_transpose" do 
    it "should take a 2D array and switch the indicies" do
        expect(my_transpose([
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8]
          ])).to eq([
            [0, 3, 6],
            [1, 4, 7],
            [2, 5, 8]])
    end

end

describe "#stock_picker" do
    it "should take an array of stock prices and return the biggest difference between stock indicies" do
        expect(stock_picker([1,2,3])).to eq([0,2])
    end
end
