strings = ["one", "two", "four", "five"]
# strings.inject(0) { 
#   |sum, str| str.size == 4 ? sum : sum + str.size 
# }
# p str
# strings.inject(0) do |sum, str|
#   # next if str.size == 4
#   # p sum + str.size
#   p str.size
# end

# p strings

# count = 0
# loop do
#   break if count == 10
#   puts count
#   count += 1
# end

1.next

> def add_two(num)
>   num + 2
> end
=> :add_two    #this is just showing that I've built a method
>
> def multiply_two(num)
>    num * 2
> end
=> :multiply_two
>
> new_number = add_two(2)
=>4
> multiply_two(new_number)
=>8