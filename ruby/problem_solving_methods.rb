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
