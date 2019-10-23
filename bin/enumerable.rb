module Enumerable
  def my_each
    i = 0
    while i < length
      yield self[i]
      i += 1
    end
    self
  end

  def my_each_with_index
    i = 0
    while i < length
      yield self[i], i
      i += 1
    end
    self
  end

  def my_select
    array = []
    i = 0
    while i < length
      array << self[i] if yield(self[i])
      i += 1
    end
    array
  end

  def my_all?
    all_true = true
    i = 0
    while i < length
      all_true = false unless yield(self[i])
      i += 1
    end
    all_true
  end

  def my_any?
    any_true = false
    i = 0
    while i < length
      any_true = true if yield(self[i])
      i += 1
    end
    any_true
  end

  def my_none?
    all_false = true
    i = 0
    while i < length
      all_false = false if yield(self[i])
      i += 1
    end
    all_false
  end

  def my_count(value = nil)
    count = 0
    if block_given?
      my_each { |x| count += 1 if yield(x) }
    elsif !value.nil?
      my_each { |x| count += 1 if value == x }
    else
      my_each { count += 1 }
    end
    count
  end

  def my_map
    array = []
    i = 0
    while i < length
      array << yield(self[i])
      i += 1
    end
    array
  end

  def my_inject(sum = 0)
    i = 0
    while i < length
      sum = yield(sum, self[i])
      i += 1
    end
    sum
  end
end

def multiply_els(array)
  array.my_inject(1) { |x, y| x * y }
end
