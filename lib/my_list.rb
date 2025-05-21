class MyList
	include Enumerable

	def initialize(items)
		@items = items
	end

	def each
		return enum_for(:each) unless block_given?

	  @items.each {|item| yield item}	
	end

	def my_map
    return enum_for(:my_map) unless block_given?

    result = []
		each {|item| result << yield(item)}
	  result
	end

	def my_select
		return enum_for(:my_select) unless block_given?

    result = []
    each do |item|
    	result << item if yield(item)
    end
    result
	end

	def my_reject
		return enum_for(:my_reject) unless block_given?

	  result = []
	  each {|item| result << item unless yield(item)}
	  return result
	end

	def my_reduce(initial_value=nil)
		return enum_for(:my_reduce) unless block_given?
		
		initial_value_set = !initial_value.nil?
		sum = initial_value
		each do |item|
			if initial_value_set
			  sum = yield(sum, item)
			else
				initial_value_set = true
				sum = item
			end
		end
		sum
	end

	def my_all?
		return enum_for(:my_all?) unless block_given?

		each do |item|
			return false unless yield(item)
		end

		true
	end	

	def my_any?
		return enum_for(:my_any?) unless block_given?

		each do |item|
			return true if yield(item)
		end
		
		false
	end
end