def caesar_cipher(string, shift_factor)
  new_string = ''
  string.each_char do |char|
    ascii_char = char.ord

    if ascii_char >= 65 && ascii_char <= 90
      ascii_char += shift_factor
      ascii_char -= 26 if ascii_char > 90
    elsif ascii_char >= 97 && ascii_char <= 122
      ascii_char += shift_factor
      ascii_char -= 26 if ascii_char > 122
    end

    new_string << ascii_char.chr
  end
  puts new_string
end

caesar_cipher('What a string!', 25)
