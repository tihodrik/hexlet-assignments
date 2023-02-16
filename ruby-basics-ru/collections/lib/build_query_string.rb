# frozen_string_literal: true

# BEGIN
def build_query_string(params)
  params.keys.sort.each_with_object([]) do |key, result|
    result << "#{key}=#{params[key]}"
  end.join('&')
end
# END
