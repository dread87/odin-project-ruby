def substrings(string, dictionary)
  hash = {}
  str = string.downcase

  dictionary.each do |word|
    matches = str.scan(word).length
    hash[word.to_sym] = matches unless matches.zero?
  end

  hash
end

dict = %w[below down go going horn how howdy it i low own part partner sit]

p substrings('below', dict)
p substrings("Howdy partner, sit down! How's it going?", dict)
