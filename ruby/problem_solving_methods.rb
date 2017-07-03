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

# Pseudocode bubble sorting alogrithm



=end

test = [1, 2, 3, 4, 5, 6, 7, 8]
shuffle_test = test.shuffle
def sorter(ary, control)
  i = 0

  until ary == control do

    if ary[i + 1] == nil
      p "starting over"
      i = 0

    elsif ary[i] > ary[i + 1]
      p "Swap occurred"
      ary[i], ary[i + 1] = ary[i + 1], ary[i]
      p ary
      i += 1

    else
      p "Swap did not occur"
      p ary
      i += 1
    end

  end

end
p shuffle_test
p "^ Shuffled"
p sorter(shuffle_test, test)