# frozen_string_literal: true

# BEGIN
def get_same_parity(array)
  array.filter { |a| (array[0] + a).even? }
end
# END
