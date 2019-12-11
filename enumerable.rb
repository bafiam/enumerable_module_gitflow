# frozen_string_literal: true

# rubocop:disable Metrics/ModuleLength
module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    array = is_a?(Range) ? to_a : self
    x = 0
    while x < array.length
      yield(self[x])
      x += 1
    end
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    array = is_a?(Range) ? to_a : self
    i = 0
    while i < array.length
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

  def my_all?(arg = nil)
    if block_given?
      my_each { |x| return false unless yield(x) }
    elsif arg.class == Class
      my_each { |x| return false unless x.is_a? arg }
    elsif arg.class == Regexp
      my_each { |x| return false unless x.match? arg }
    elsif !arg.nil?
      my_each { |x| return false unless x == arg }
    else
      my_each { |x| return false unless x }
    end
    true
  end

  def my_any?(arg = nil)
    if block_given?
      my_each { |w| return true if yield(w) }
    elsif arg.class == Class
      my_each { |w| return true if w.is_a? arg }
    elsif arg.class == Regexp
      my_each { |w| return true if w.match? arg }
    elsif !arg.nil?
      my_each { |w| return true if w == arg }
    else
      my_each { |w| return true if w }
    end
    false
  end

  def my_none?(arg = nil)
    if block_given?
      my_each { |w| return false if yield(w) }
    elsif arg.class == Class
      my_each { |w| return false if w.is_a? arg }
    elsif arg.class == Regexp
      my_each { |w| return false if w.match? arg }
    elsif !arg.nil?
      my_each { |w| return false if w == arg}
    else
      my_each { |w| return false if w }
    end
    true
  end

  def my_count(arg = nil)
    unless arg.nil?
      count = 0
      my_each { |i| count += 1 if arg == i }
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
    my_each { |i| results = yield(results, self[i]) }
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
