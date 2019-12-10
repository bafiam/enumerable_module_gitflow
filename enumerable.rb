# frozen_string_literal: true

# rubocop:disable Metrics/ModuleLength
module Enumerable
  def my_each
    return self unless block_given?

    x = 0
    while x < length
      yield(self[x])
      x += 1
    end
  end

  def my_each_with_index
    return self unless block_given?

    i = 0
    while i < length
      yield(self[i], i)
      i += 1
    end
  end

  def my_select
    return self unless block_given?

    y = 0
    new_arr = []
    while y < length
      new_arr.push(self[y]) if yield(self[y])
      y += 1
    end
    new_arr
  end

  def my_all?
    return self unless block_given?

    w = 0
    while w < length
      return false unless yield(self[w])

      w += 1
    end
    true
  end

  def my_any?
    return self unless block_given?

    i = 0
    while i < length
      return true if yield(self[i])

      i += 1
    end
    false
  end

  def my_none?
    return self unless block_given?

    i = 0
    while i < length
      return false if yield(self[i])

      i += 1
    end
    true
  end

  def my_count
    return length unless block_given?

    i = 0
    results = 0
    while i < length
      results += 1 if yield(self[i])
      i += 1
    end
    results
  end

  def my_map
    return self unless block_given?

    i = 0
    new_arr = []
    while i < length
      new_arr.push(self[i]) if yield(self[i])
      i += 1
    end
    new_arr
  end

  def my_inject(results = 0)
    return self unless block_given?

    i = 0
    while i < length

      results = yield(results, self[i])
      i += 1
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
