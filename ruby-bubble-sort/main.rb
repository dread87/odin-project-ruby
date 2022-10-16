# Build a method #bubble_sort that takes an array and returns a sorted array. 
# It must use the bubble sort methodology.

# > bubble_sort([4,3,78,2,0,2])
# => [0,2,2,3,4,78]

def bubble_sort(array = [])
    iterations = array_length = array.length
    while iterations > 0 do
        for index in 0..array_length - 2
            if array[index] > array[index+1]
                temp = array[index]
                array[index] = array[index+1]
                array[index+1] = temp
            end
        end
        iterations -= 1
    end
    p array
end

bubble_sort([4,3,78,2,0,2])
