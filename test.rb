# frozen_string_literal: true

# Test

# ########my_each method

arr = Array(1..10)
Enumerable.my_each(arr) do |x|
  puts x**4
end

# ########my_each_with_index

arr = %w[apple orange banana]
Enumerable.my_each_with_index(arr) do |key, idx|
  puts key.to_s if idx == 1
end

# ########my_select

fruits = %w[apple orange banana bacovo guava basa]
puts(Enumerable.my_select(fruits) do |fruit|
  fruit.start_with? 'b'
end)

# ########my_myall?

arr = %w[vacua vagal vague vagus vails vairs]
arr1 = Array(2..9)
arr2 = Array(-1..7)
puts(print('expected true :', Enumerable.my_all?(arr1) { |x| x > 1 })) # true
puts(print('expected false :', Enumerable.my_all?(arr2) { |x| x > 1 })) # false, we have negative value which are < 1
puts(print('expected true :', Enumerable.my_all?(arr) { |x| x.start_with? 'v' })) # true, all start with a v

# ########my_any?

puts(print(Enumerable.any?([2, 3, 1, 6, -4]) { |x| x <= 0 })) # return true, their is atleast "6">
arr = %w[vacua vagal vague vagus vails vairs]
puts(print(Enumerable.any?(arr) { |x| x.start_with? 'y' })) # return false

# ########my_none?

arr = %w[ant bear cat]
puts(print(Enumerable.my_none?(arr) { |word| word.length == 5 })) #=> true
puts(print(Enumerable.my_none?(arr) { |word| word.length >= 4 })) #=> false

# ########my_count?

ary = [1, 2, 4, 2, 2, 2]
puts(print(Enumerable.my_count(ary, &:even?))) #=> 5
puts(print(Enumerable.my_count(ary) { |x| x == 2 })) #=> 4

# ########my_map

arr = Array(0...16)
a = %w[albatross dog horse donkey]
puts(print(Enumerable.my_map(arr) { |i| i >= 5 })) #=> [5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
puts(print(Enumerable.my_map(a) { |word| word.start_with? 'd' })) #=> ["dog", "donkey"]

# ########my_inject

arr = Array(1..4)
arr3 = Array(5..10)
arr2 = Array(4..9) # [4,5,6,7,8,9]
puts(print(Enumerable.my_inject(arr, 0) { |result, element| result + element })) #=> 10
puts(print(Enumerable.my_inject(arr2, 0) { |result, element| result + element })) #=> 39
puts(print(Enumerable.my_inject(arr3, 0) { |result, element| result + element })) #=> 45

# ########multiply_els

arr = [2, 4, 5]
puts(print(Enumerable.multiply_els(arr, 1))) #=> 40

# ########my-map-modify-proc

arr = Array(0...16)
a = %w[albatross dog horse donkey]
map_proc1 = proc { |i| i >= 5 }
map_proc2 = proc { |word| word.start_with? 'd' }

puts(print(Enumerable.my_map_modify(arr, &map_proc1)))
puts(print(Enumerable.my_map_modify(a, &map_proc2)))

# ########my_map_expanded

block && proc

arr = Array(0...16)
a = %w[albatross dog horse donkey]
map_proc2 = proc { |word| word.start_with? 'd' }
#  #####block
puts(print(Enumerable.my_map_expanded(arr) { |i| i >= 5 })) #=> [5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
# ######proc
puts(print(Enumerable.my_map_expanded(a, &map_proc2))) #=> ["dog", "donkey"]
