require_relative '../lib/my_list'

describe 'MyList' do
	before do
		@list = MyList.new(["apple", "banana", "grapes"])
	end

	describe "#each" do
		it "iterates through each item" do
	    result = []
		  @list.each { |item| result << item }
		  expect(result).to eq(["apple", "banana" , "grapes"])
		end

		it "returns Enumerator if no block is given" do
		  expect(@list.each).to be_an(Enumerator)
		end
  end

  describe "#my_map" do 
	  it "maps each item from collection into new array"  do
      result = @list.my_map { |item| item.capitalize }
      expect(result).to eq(["Apple", "Banana", "Grapes"])
	  end

		it "returns Enumerator if no block is given" do
		  expect(@list.my_map).to be_an(Enumerator)
		end
	end

	describe "#my_select" do
		it "filters the collection" do
			result = @list.my_select {|item| item == "apple"}
		  expect(result).to eq(["apple"])
		end

		it "returns Enumerator if no block is given" do
		  expect(@list.my_select).to be_an(Enumerator)
		end
	end

	describe "#my_reject" do 
		it "rejects given item from collection"  do
			result = @list.my_reject {|item| item == "banana"}
			expect(result).to eq(["apple", "grapes"])
		end

		it "returns Enumerator if no block is given" do
		  expect(@list.my_reject).to be_an(Enumerator)
		end
	end

	describe "#my_reduce" do
		before do
			@list = MyList.new([1,2,3,4,5])
		end

		it "sums the items with initial value" do
		  result = @list.my_reduce(0){|sum, item| sum + item}
		  expect(result).to eq(15)
		end

		it "sums the items without initial value" do
		  result = @list.my_reduce{|sum, item| sum + item}
		  expect(result).to eq(15)
		end

		it "returns Enumerator if no block is given" do
		  expect(@list.my_reduce(0)).to be_an(Enumerator)
		end

		it "returns nil for empty array" do
			list = MyList.new([])
			result = list.my_reduce{|sum, item| sum + item}
		  
		  expect(result).to be_nil
		end

		it "concates string" do
			list = MyList.new(["a","b","c"])
			result = list.reduce("") {|sum, item| sum + item }
			expect(result).to eq("abc")
		end
	end
end