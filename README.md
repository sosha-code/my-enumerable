## MyEnumerable

This project re-implements, the core enumerbale methods like `map`, `select`, `reject`, `reduce` with custom methods like `each`, `my_map`, `my_select`, `my_reject` and `my_reduce`. It also includes logical methods like `my_all?`, `my_any?`, and `my_none`.

These are built using fundamental Ruby features like blocks, yield, and enum_for.



## Files Added

- `lib/my_list.rb` -> MyList class with methods like each, my_map, my_select, my_reject and my_reduce.
- `spec/my_list_spec.rb` -> Rspec tests for methods like each, my_map, my_select, my_reject and my_reduce. 

## Features

- Custom `#each` method for iteration
- `#my_map` – transform each item
- `#my_select` – filter items where the block returns true
- `#my_reject` – filter items where the block returns false
- `#my_reduce` – add items into a single value
- `#my_all?` – check if all items satisfy the condition
- `#my_any?` – check if any item satisfies the condition
- `#my_none?` – check if no items satisfy the condition
- Returns an Enumerator when no block is given

## Example usage

```ruby

require_relative 'lib/my_list'

list = MyList.new(["apple", "banana", "grape"])

# Custom map
list.my_map { |item| item.upcase }
# => ["APPLE", "BANANA", "GRAPE"]

# Custom select
list.my_select { |item| item.include?("pp") }
# => ["apple"]

# Custom reject
list.my_reject { |item| item.include?("p") }
# => ["banana"]

# Custom reduce
list2 = MyList.new([1, 2, 3, 4])
list2.my_reduce(0) { |sum, n| sum + n }
# => 10

list.my_all? { |item| item.length > 2 }
# => true

list.my_any? { |item| item.start_with?("b") }
# => true

list.my_none? { |item| item.include?("z") }
# => true
