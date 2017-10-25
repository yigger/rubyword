require "rubyword"

def remove_whitespace(wordml)
  wordml.gsub(/\s+/, ' ').gsub(/(?<keep>>)\s+|\s+(?<keep><)/, '\k<keep>').strip
end