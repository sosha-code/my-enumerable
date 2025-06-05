## MyEnumerable

This Ruby project re-implements core Enumerable methods like `map`, `select`, `reject`, and logical methods such as `all?`, `any?`, and `none?`. It also includes a user-friendly Command Line Interface (CLI) to interact with these methods dynamically.

These are built using fundamental Ruby features like blocks, yield, and enum_for.



## Files Added

- `lib/my_list.rb` -> MyList class with methods like each, my_map, my_select, my_reject and my_reduce.
- `spec/my_list_spec.rb` -> Rspec tests for methods like each, my_map, my_select, my_reject and my_reduce. 

## Features

- Custom implementations of common Ruby enumerable methods:
  - `my_map`
  - `my_select`
  - `my_reject`
  - `my_all?`
  - `my_any?`
  - `my_none?`

- Interactive CLI to:
  - Enter a custom list of words
  - Choose a method
  - Choose a condition (like includes 'a', starts with 'b', length > 5)

- Input validation and graceful exits

- Clean modular code structure


## 🛠 How to Run

Make sure you have Ruby installed.

1. Clone this repository:
```bash
   git clone https://github.com/your-username/my_enumerable.git
   cd my_enumerable
   ruby cli.rb
```




## Example usage

```ruby

Enter comma-separated words (like: apple, banana, cherry). Type 'exit' to quit:
> apple, banana, cat

Choose a method number:
1. my_map
2. my_select
...

Choose a condition:
1. Include 'a'
2. Starts with 'b'
...

Result of my_select: ["apple", "banana"]
