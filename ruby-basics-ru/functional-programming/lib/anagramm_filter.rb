# frozen_string_literal: true

# BEGIN
def anagramm_filter(word, samples)
  w = word.chars.sort
  samples.filter { |sample| (sample.chars.sort <=> w).zero? }
end
# END
