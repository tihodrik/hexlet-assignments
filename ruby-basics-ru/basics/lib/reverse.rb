# frozen_string_literal: true

# BEGIN
def reverse(text)
  result = ''
  text.each_char { |c| result = c + result }
  result
end
# END
