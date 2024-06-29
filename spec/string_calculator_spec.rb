require 'rspec'
require_relative '../string_calculator'

RSpec.describe StringCalculator do
  describe '.add' do
    it 'returns 0 for an empty string' do
      expect(StringCalculator.add("")).to eq(0)
    end

    it 'returns the number for a single number' do
      expect(StringCalculator.add("1")).to eq(1)
    end

    it 'returns the sum of two numbers' do
      expect(StringCalculator.add("1,5")).to eq(6)
    end

    it 'returns the sum of any amount of numbers' do
      expect(StringCalculator.add("1,2,3,4,5")).to eq(15)
    end

    it 'handles new lines between numbers' do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end

    it 'supports custom delimiters' do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
    end

    it 'throws an exception for negative numbers' do
      expect { StringCalculator.add("-1,2") }.to raise_error(ArgumentError, "negative numbers not allowed: -1")
    end
    
    it 'throws an exception with all negative numbers in the message' do
      expect { StringCalculator.add("2,-4,3,-5") }.to raise_error(ArgumentError, "negative numbers not allowed: -4, -5")
    end
  end
end