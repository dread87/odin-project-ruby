def fibonacci(n)
  return [0] if n == 0
  return [0, 1] if n == 1

  arr = [0, 1]
  (2..n).each do |index|
    arr[index] = arr[index - 1] + arr[index - 2]
  end
  arr
end

def fibonacci_recursive(n)
  return [0] if n == 0
  return [0, 1] if n == 1

  arr = fibonacci_recursive(n - 1)
  arr << (arr[-2] + arr[-1])
end
