# frozen_string_literal: true

# BEGIN
def count_by_years(users)
  men = users.filter { |u| u[:gender] == 'male' }

  men.each_with_object(Hash.new(0)) do |user, result|
    year, * = user[:birthday].split('-')
    result[year] += 1
  end
end
# END
