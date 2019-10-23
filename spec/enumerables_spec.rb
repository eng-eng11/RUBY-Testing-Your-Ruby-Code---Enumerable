# frozen_string_literal: true

# spec/enumerables_spec.rb

require_relative '../bin/enumerable.rb'

RSpec.describe Enumerable do
  let(:array_1) { [1, 2, 3] }
  let(:array_2) { [3] }
  let(:array_3) { [nil, true, 99] }
  let(:array_4) { [1, 2, 3, 1, 2, 3, 4, 1, 2, 3] }

  describe '#my_each' do
    it 'iterates through an array' do
      expect(array_1.my_each { |x| x }).to eql(array_1)
      expect(array_1.my_each { |x| x * 2 }).to eql(array_1)
      expect(array_1.my_each { |x| x * 4 }).to eql(array_1)
    end
  end

  describe '#my_each_with_index' do
    it 'iterates through an array and its index' do
      expect(array_1.my_each_with_index { |x, y| x + y }).to eql(array_1)
      expect(array_1.my_each_with_index { |x, y| x * y }).to eql(array_1)
      expect(array_1.my_each_with_index { |x, y| x - y }).to eql(array_1)
    end
  end

  describe '#my_select' do
    it 'creates a new array based on the conditions in the block' do
      expect(array_4.select { |x| x == 1 }).to eql([1, 1, 1])
      expect(array_2.select { |x| x == 1 }).to eql([])
      expect(array_4.select { |x| x > 3 }).to eql([4])
      expect(array_3.select { |x| x == true }).to eql([true])
    end
  end

  describe '#my_all?' do
    it 'tests whether the given condition is true for every item in the array.' do
      expect(array_1.my_all? { |x| x == 1 }).to eql(false)
      expect(array_1.my_all? { |x| x == true }).to eql(false)
      expect(array_1.my_all? { |x| x > 0 }).to eql(true)
    end
  end

  describe '#my_any?' do
    it 'tests whether the given condition is true for every item in the array.' do
      expect(array_3.my_any? { |x| x == true }).to eql(true)
      expect(array_4.my_any? { |x| x == true }).to eql(false)
      expect(array_4.my_any? { |x| x > 0 }).to eql(true)
    end
  end

  describe '#my_none?' do
    it 'tests whether the given condition is true for every item in the array.' do
      expect(array_3.my_none? { |x| x == true }).to eql(false)
      expect(array_4.my_none? { |x| x == true }).to eql(true)
      expect(array_4.my_none? { |x| x > 0 }).to eql(false)
    end
  end
end
