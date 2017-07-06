# Release 0

test = [2, 4, 6, 8, 10, 12]

def search_array(ary, target)
  i = 0
  match = nil
  ary.each do |x|
    if x == target
      match = i
    else
      i += 1
    end
  end
  p match
end

p test.length
search_array(test, 12)
search_array(test, 23)

def search_array2(ary, target)
  i = 0
  match = nil
  ary.each do |x|
    case
    when x == target then match = i
    else i += 1
    end
  end
  p match
end

p test.length
search_array2(test, 10)
search_array2(test, 23)



# Release 1

def fib(n)

  fib_array = []
  first = 0
  second = 1

  if n == 0
    fib_array.push(nil)
  elsif n == 1
    fib_array.push(0)
  else
    fib_array.push(0,1)
    if n >= 3
      (3..n).each do

      next_number = (first + second)
      first = second
      fib_array.push(second = next_number)

      end
    end
  end
  return fib_array

end


if fib(100).last == 218922995834555169026
  p fib(100).last
else
  p "Try again, my dude."
end

=begin

Release 2

# Release 2
# Sorting algorithm: bubble method
# The bubble method iterates through an array of
# integers and compares each set of two in order
# It simply switches the two values based on value
# and relies on a loop that ends once all values
# match the value order.


# The array works through pairs, which we can
# pull using a loop, and then we'll
# compare the two values using a simple lesser-than
# operator.

# The algorithm will finish naturally as long
# as the sole 'if' statement

=end

def sorter(arr)

return arr if arr.length <= 1

not_sorted = true

    while not_sorted
     not_sorted = false
     (arr.length-1).times do |i|
        if arr[i] > arr[i+1]
          arr[i], arr[i+1] = arr[i+1], arr[i]
          not_sorted = true
          p arr
          p "swap occurred"
        end
       end
     end
    arr
end

test = [1, 2, 3, 4, 5, 6, 7, 8]
shuffle_test = test.shuffle
p sorter(shuffle_test)