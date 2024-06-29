class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?
    
    if numbers.start_with?("//")
      delimiter = numbers[2]
      numbers = numbers.split("\n", 2).last
    else
      delimiter = ","
    end
    
    nums = numbers.gsub("\n", delimiter).split(delimiter).map(&:to_i)
    negatives = nums.select { |n| n < 0 }
    
    if negatives.any?
      raise ArgumentError, "negative numbers not allowed: #{negatives.join(', ')}"
    end
    
    nums.sum
  end
end