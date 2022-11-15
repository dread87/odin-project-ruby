def flatten_array(arr, flattened = [])
  arr.each do |element|
    if element.is_a? Array
      flatten_array(element, flattened)
    else
      flattened << element
    end
  end

  flattened
end

p flatten_array([1, 2, 3, [4, [5, 6]]])
