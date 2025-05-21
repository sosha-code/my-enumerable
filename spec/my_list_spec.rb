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

	describe "#my_all?" do
	  it "returns true if all items match condition" do
	  	result = @list.my_all? {|item| item.include?("a")}
	    expect(result).to be true
	  end	

	  it "returns false if all items doesnt match condition" do
	  	result = @list.my_all? {|item| item.include?("b")}
	    expect(result).to be false
	  end

	  it "returns Enumerator if no block is given" do
		  expect(@list.my_all?).to be_an(Enumerator)
		end
	end

	describe "#my_any?" do
		it "returns true if atleast one item match the condition" do
	  	result = @list.my_any? {|item| item.include?("a")}
	    expect(result).to be true
	  end			

	  it "returns false if no items match the condition" do
	  	result = @list.my_any? {|item| item.include?("k")}
	    expect(result).to be false
	  end	

	  it "returns Enumerator if no block is given" do
		  expect(@list.my_any?).to be_an(Enumerator)
		end
	end

	describe "#my_none?" do
		it "returns true if none of the item matches the condition" do
	  	result = @list.my_none? {|item| item.size == 3 }
	    expect(result).to be true
	  end			

	  it "returns false if any item matches the condition" do
	  	result = @list.my_none? {|item| item.include?("a")}
	    expect(result).to be false
	  end	

	  it "returns Enumerator if no block is given" do
		  expect(@list.my_none?).to be_an(Enumerator)
		end
	end
end