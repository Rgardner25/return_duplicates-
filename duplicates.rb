require 'rspec'
require 'date'

class Array
  def find_duplicates
    select.with_index do |e, i|
      i
      self.index(e)
      i != self.index(e)
    end
  end

  def slow_find_duplicates
    group_by { |e| e }.
      each_with_object([]) do |i, arr|
        arr << i.last.drop(1)
      end.flatten
  end
end

ints = [1, 2, 1, 4, 2, 1]
ints.slow_find_duplicates
ints.find_duplicates
