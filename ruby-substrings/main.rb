def substrings(string, dictionary)
    hash = {}
    str = string.downcase

    dictionary.each do |word|
        matches = str.scan(word).length
        hash[word.to_sym] = matches unless matches == 0
    end

    return hash
end

dict = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

substrings("below", dict)
substrings("Howdy partner, sit down! How's it going?",dict)