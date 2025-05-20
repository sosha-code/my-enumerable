## MyEnumerable

This project re-implements, the core enumerbale methods like map, select, reject, reduce with custom methods like each, my_map, my_select, my_reject and my_reduce, using blocks, yield and enum_for features. 

## Files Added

- `lib/my_list.rb` -> MyList class with methods like each, my_map, my_select, my_reject and my_reduce.
- `spec/my_list_spec.rb` -> Rspec tests for methods like each, my_map, my_select, my_reject and my_reduce. 

## Features

- Custom `#each` method to enable iteration
- `#my_map` – map-like behavior
- `#my_select` – select items based on a condition
- `#my_reject` – exclude items based on a condition
- `#my_reduce` – accumulate values
- Returns `Enumerator` if no block is given

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
