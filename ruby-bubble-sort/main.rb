# Build a method #bubble_sort that takes an array and returns a sorted array.
# It must use the bubble sort methodology.

# > bubble_sort([4,3,78,2,0,2])
# => [0,2,2,3,4,78]

def bubble_sort(array = [])
  iterations = array_length = array.length
  while iterations.positive?
    (0..array_length - 2).each do |i|
      next unless array[i] > array[i + 1]

      temp = array[i]
      array[i] = array[i + 1]
      array[i + 1] = temp
    end
    iterations -= 1
  end
  p array
end

bubble_sort([4, 3, 78, 2, 0, 2])
