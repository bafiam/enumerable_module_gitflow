# frozen_string_literal: true

module Enumerable
  def my_each(arr)
    x = 0
    while x < arr.length
      yield(arr[x])
      x += 1
    end
  end

  def my_each_with_index(arr)
    i = 0
    while i < arr.length
      yield(arr[i], i)
      i += 1
    end
  end

  def my_select(arr)
    y = 0
    new_arr = []
    while y < arr.length
      new_arr.push(arr[y]) if yield(arr[y])
      y += 1
    end
    new_arr
  end

  def my_all?(arr)
    w = 0
    while w < arr.length
      return false unless yield(arr[w])

      w += 1
    end
    true
  end

  def any?(arr)
    i = 0
    while i < arr.length
      return true if yield(arr[i])

      i += 1
    end
    false
  end

  def my_none?(arr)
    i = 0
    while i < arr.length
      return false if yield(arr[i])

      i += 1
    end
    true
  end

  def my_count(arr)
    i = 0
    results = 0
    while i < arr.length
      results += 1 if yield(arr[i])
      i += 1
    end
    results
  end

  def my_map(arr)
    i = 0
    new_arr = []
    while i < arr.length
      new_arr.push(arr[i]) if yield(arr[i])
      i += 1
    end
    new_arr
  end

  def my_inject(arr, results)
    i = 0
    while i < arr.length

      results = yield(results, arr[i])
      i += 1
    end
    results
  end

  def multiply_els(arr, results)
    my_inject(arr, results) { |result, num| result * num }
  end

  def my_map_modify(arr)
    i = 0
    new_arr = []
    while i < arr.length
      new_arr.push(arr[i]) if proc.call(arr[i])
      i += 1
    end
    new_arr
  end

  def my_map_expanded(arr)
    i = 0
    new_arr = []
    while i < arr.length
      if block_given?
        new_arr.push(arr[i]) if yield(arr[i])
      elsif proc.call(arr[i])
        new_arr.push(arr[i])
      end
      i += 1
    end
    new_arr
  end
end
