require "rspec"
require "coding_challenge"

describe "#my_uniq" do
    it "uniq removes duplicates from an array" do
        expect(my_uniq([1,2,1,3,3]) ).to eq([1,2,3])
    end
end

describe "#two_sum"