# frozen_string_literal: true

require './enumerable.rb'
# Test for each method

# # ########my_each method

# arr = Array(1..10)
# arr.my_each { |x| puts x**4 }
# [1, 2, 3, 4, 5].my_each { |num| puts num }
# [1, 2, 3, 4, 5].my_each

# # ########my_each_with_index

# arr = %w[apple orange banana]
# arr.my_each_with_index { |key, idx| puts key.to_s if idx == 1 }
# [1, 2, 3, 4, 5].my_each_with_index { |num| puts num }

# # # ########my_select

# fruits = %w[apple orange banana bacovo guava basa]
# puts(fruits.my_select do |fruit|
#   fruit.start_with? 'b'
# end)
# [1, 2, 3, 4, 5].my_select { |num| puts num }
# [1, 2, 3, 4, 5].my_select

# # ########my_myall?

# arr = %w[vacua vagal vague vagus vails vairs]
# arr1 = Array(2..9)
# arr2 = Array(-1..7)
# puts(print('expected true :', arr1.my_all? { |x| x > 1 })) # true
# puts(print('expected false :', arr2.my_all? { |x| x > 1 })) # false, we have negative value which are < 1
# puts(print('expected true :', arr.my_all? { |x| x.start_with? 'v' })) # true, all start with a v
# puts(print([1, 2, 3, 4, 5].my_all? { |num| num < 10 }))
# puts(print([1, 2, 3, 4, 5].my_all?))
# puts(print([1, 2, 3, 4, 5].my_all? { |i| i.is_a?(Integer) }))
# puts(print('regex :', %w[saheed oladele suretrust].my_all? { /d/ }))
puts(print([1, 2, 3, 4, '5'].my_all?(Integer)))
# # # ########my_any?

# puts(print([2, 3, 1, 6, -4].my_any? { |x| x <= 0 })) # return true, their is atleast "6">
# arr = %w[vacua vagal vague vagus vails vairs]
# puts(print(arr.my_any? { |x| x.start_with? 'y' })) # return false
# puts(print([1, 2, 3, 4, 5].my_any? { |num| num < 10 }))
# puts(print([1, 2, 3, 4, 5].my_any?))
# puts(print([1, 2, 3, 4, 5].my_any? { |i| i.is_a?(Integer) })) # => true
# puts(print('regex :', %w[saheed oladele suretrust].my_any? { /d/ }))

# # # ########my_none?

# arr = %w[ant bear cat]
# puts(print(arr.my_none? { |word| word.length == 5 })) #=> true
# puts(print(arr.my_none? { |word| word.length >= 4 })) #=> false
# puts(print([1, 2, 3, 4, 5].my_none? { |num| num < 10 }))
# puts(print([1, 2, 3, 4, 5].my_none?))
# puts(print([1, 2, 3, 4, 5].my_none? { |i| i.is_a?(Integer) })) # => false
# puts(print('regex :', %w[saheed oladele suretrust].my_none? { /d/ }))

# # # ########my_count?

# ary = [1, 2, 4, 2, 2, 2]
# puts(print(ary.my_count(&:even?))) #=> 5
# puts(print(ary.my_count { |x| x == 2 })) #=> 4
# puts(print([1, 2, 3, 4, 5].my_count { |num| num == 4 })) #=> 1
# puts(print([1, 2, 3, 4, 5].my_count)) #=> 5

# # # ########my_map

# arr = Array(0...16)
# a = %w[albatross dog horse donkey]
# puts(print(arr.my_map { |i| i >= 5 })) #=> [5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
# puts(print(a.my_map { |word| word.start_with? 'd' })) #=> ["dog", "donkey"]
# puts(print([1, 2, 3, 4, 5].my_map { |num| num < 3 }))

# # # ########my_inject

# arr = Array(1..4)
# arr3 = Array(5..10)
# arr2 = Array(4..9) # [4,5,6,7,8,9]
# puts(print(arr.my_inject(0) { |result, element| result + element })) #=> 10
# puts(print(arr2.my_inject(0) { |result, element| result + element })) #=> 39
# puts(print(arr3.my_inject(0) { |result, element| result + element })) #=> 45
# puts(print([1, 2, 3, 4, 5].my_inject(0, &:+)))

# # # ########multiply_els

# arr = [2, 4, 5]
# puts(print(arr.multiply_els)) #=> 40

# # # ########my-map-modify-proc

# arr = Array(0...16)
# a = %w[albatross dog horse donkey]
# map_proc1 = proc { |i| i >= 5 }
# map_proc2 = proc { |word| word.start_with? 'd' }

# puts(print(arr.my_map_modify(&map_proc1)))
# puts(print(a.my_map_modify(&map_proc2)))

# # # ########my_map_expanded

# # block && proc

# arr = Array(0...16)
# a = %w[albatross dog horse donkey]
# map_proc2 = proc { |word| word.start_with? 'd' }
# #  #####block
# puts(print(arr.my_map_expanded { |i| i >= 5 })) #=> [5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
# # ######proc
# puts(print(a.my_map_expanded(&map_proc2))) #=> ["dog", "donkey"]
