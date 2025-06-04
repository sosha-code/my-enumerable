require "../lib/my_list.rb"

CUSTOM_METHODS = {
	1 => "my_map", 
	2 => "my_select", 
	3 => "my_reject", 
	4 => "my_all?", 
	5 => "my_any?", 
	6 => "my_none?" 
}
def entered_exit?(input)
	["exit", "quit"].include?(input)
end

def printing_exit
  puts "You are exiting the program!"
end

def prompt_list
  item_input = gets.chomp.strip.downcase

  return "exit" if entered_exit?(item_input)

  return nil if item_input.empty? || item_input.match?(/["'\d]/)
  

  item_list = item_input.split(",").map(&:strip).reject(&:empty?)
  
  item_list.empty? ? nil : item_list
end

def prompt_custom_method

  selected_method = nil

	until selected_method
    puts "\nChoose a method number (or type 'exit' to quit):"
		entered_method = gets.chomp

 		return "exit" if entered_exit?(entered_method)
      
		selected_method = CUSTOM_METHODS[entered_method.to_i]
		puts "Invalid method selection. Please choose correct method or exit to quit." unless selected_method
	end

	selected_method
end

def prompt_condition
	selected_condition = nil

	until selected_condition
		puts "\nChoose condition number (or type 'exit' to quit):"
		entered_choice = gets.chomp

	 	return "exit" if entered_exit?(entered_choice)
    
    if (1..3).include?(entered_choice.to_i)
			selected_condition = case entered_choice.to_i
			when 1 then ->(item) { item.include?("a") }
			when 2 then ->(item) { item.start_with?("b") }
			when 3 then ->(item) { item.length > 5 } 
			end
	  else
		  puts "Invalid selection. Please select from below options!" 
	  end
  end	

	selected_condition
end


loop do
  puts "\nEnter comma-separated words (like: apple, banana, cherry). No numbers or quotes allowed. Type 'exit' to quit:"

  entered_list = prompt_list

  case entered_list
  when nil
  	puts "Please enter valid input"
  	next
  when "exit"
  	printing_exit
  	break
  end

  #----------
	puts "Your Entered list:\n #{entered_list}"
  my_list = MyList.new(entered_list)

  puts "\nAvailable methods to select from:\n"

	CUSTOM_METHODS.each do |k,v|
	 puts "#{k}. #{v}"
	end

  selected_method = prompt_custom_method

  break printing_exit if selected_method == "exit"


	puts "\n#{selected_method} got selected."

  #------------
  puts "\nAvailable conditions to select from:\n"
	puts "1. Include 'a'"
	puts "2. Starts with 'b'"
	puts "3. Length > 5"

  selected_condition = prompt_condition
  break printing_exit if selected_condition == "exit"

  begin
	  result = my_list.send(selected_method, &selected_condition)
		puts "Result of #{selected_method}: #{result}"
	rescue => e
		puts "Something went wrong: #{e}"
	end	
end



