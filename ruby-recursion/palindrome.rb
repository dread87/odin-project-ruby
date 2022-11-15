def palindrome(str)
  if str.length <= 1
    true
  else
    str[0] == str[-1] ? palindrome(str[1..-2]) : false
  end
end
