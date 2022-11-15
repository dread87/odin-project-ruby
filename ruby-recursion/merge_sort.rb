def merge(array1 = [], array2 = [])
  merged = []

  while !array1.empty? && !array2.empty?
    if array1[0] > array2[0]
      merged << array2[0]
      array2.delete_at(0)
    else
      merged << array1[0]
      array1.delete_at(0)
    end
  end

  until array1.empty?
    merged << array1[0]
    array1.delete_at(0)
  end

  until array2.empty?
    merged << array2[0]
    array2.delete_at(0)
  end

  merged
end

def merge_sort(array = [])
  return array if array.size <= 1

  array1 = array[0..(array.size / 2) - 1]
  array2 = array[array.size / 2..array.size]

  array1 = merge_sort(array1)
  array2 = merge_sort(array2)

  merge(array1, array2)
end
