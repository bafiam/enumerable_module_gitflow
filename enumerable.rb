# frozen_string_literal: true

# rubocop:disable Metrics/ModuleLength
module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    x = 0
    while x < length
      yield(self[x])
      x += 1
    end
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    i = 0
    while i < length
      yield(self[i], i)
      i += 1
    end
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    y = 0
    new_arr = []
    while y < length
      new_arr.push(self[y]) if yield(self[y])
      y += 1
    end
    new_arr
  end

  def my_checker(cond)
    return false if cond.nil? || cond == false

    true
  end

  def my_all?(_arg = nil)
    if block_given?
      w = 0
      while w < length
        return false unless yield(self[w])

        w += 1
      end
      return true
    end
    my_each do |x|
      return false if my_checker(x) == false
    end
    true
  end

  def my_any?(_arg = nil)
    if block_given?
      i = 0
      while i < length
        return true if yield(self[i])

        i += 1
      end
      return false
    else
      (0...length).each do |x|
        return true if !self[x].nil? && self[x] != false
      end
    end
    false
  end

  def my_none?(_arg = nil)
    if block_given?
      i = 0
      while i < length
        return false if yield(self[i])

        i += 1
      end
      return true
    else
      (0...length).each do |x|
        return false if self[x] != false && !self[x].nil?
      end
    end
    true
  end

  def my_count(arg = nil)
    unless arg.nil?
      count = 0
      my_each { |value| count += value == arg ? 1 : 0 }
      return count
    end
    if block_given?

      i = 0
      results = 0
      while i < length
        results += 1 if yield(self[i])
        i += 1
      end
      results
    else
      length
    end
  end

  def my_map
    return to_enum(:my_map) unless block_given?

    i = 0
    new_arr = []
    while i < length
      new_arr.push(yield(self[i]))
      i += 1
    end
    new_arr
  end

  def my_inject(results = 0, symbol = nil)
    return to_enum(:my_inject) unless block_given?

    my_each { |value| results = results.send symbol, value } unless symbol.nil?
    (0...length).each do |i|
      results = yield(results, self[i])
    end
    results
  end

  def multiply_els(results = 1)
    my_inject(results) { |result, num| result * num }
  end

  def my_map_modify
    i = 0
    new_arr = []
    while i < length
      new_arr.push(self[i]) if proc.call(self[i])
      i += 1
    end
    new_arr
  end

  def my_map_expanded
    i = 0
    new_arr = []
    while i < length
      if block_given?
        new_arr.push(self[i]) if yield(self[i])
      elsif proc.call(self[i])
        new_arr.push(self[i])
      end
      i += 1
    end
    new_arr
  end
end
# rubocop:enable Metrics/ModuleLength
# end of module
