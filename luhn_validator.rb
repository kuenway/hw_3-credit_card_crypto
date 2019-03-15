module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)

    if nums_a.length.even?
        doube_val = nums_a.each_with_index.map do |n,id|
            id.even? ? n*2 : n
        end
    else
        doube_val = nums_a.each_with_index.map do |n,id|
            id.even? ? n : n*2
        end
    end
    
    sum = 0
    
    doube_val.each do|n|
        n<10? sum+=n:sum+=1
        n<10? sum:sum+=(n%10)
    end
    
    (sum%10).zero?
    # TODO: use the integers in nums_a to validate its last check digit
  end
end
