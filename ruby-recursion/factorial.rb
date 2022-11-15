def factorial(number)
  number.zero? ? 1 : number * factorial(number - 1)
end
