def beer_bottles(number)
  if number.zero?
    puts 'No more bottles of beer on the wall.'
  else
    puts "#{number} bottles of beer on the wall,"
    beer_bottles(number - 1)
  end
end
