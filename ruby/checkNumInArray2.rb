arr = [23, 56, 76, 89, 22]
num_test = 22
arr_len = arr.length

# if arr_len < 1
#     puts "Array should have more than 1 element"
# else
#     if arr[0] == num_test
#         puts "#{num_test} exists in the array at the start"
#     elsif arr[arr_len - 1] == num_test
#         puts "#{num_test} exists in the array at the end"
#     else
#         puts "#{num_test} doesn't exists at the start or the end of the array"
#     end
# end

puts arr_len > 1 ? (arr[0] == num_test or arr[arr_len - 1] == num_test) : "Array should have more than 1 element"