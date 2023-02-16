# frozen_string_literal: true

# BEGIN
def fibonacci(num)
  if num.zero?
    0
  elsif num.positive?
    first_num = 0
    second_num = 1
    result = 1
    (1...num).each do
      result = first_num + second_num
      first_num = second_num
      second_num = result
    end
    result
  end
end
# END
