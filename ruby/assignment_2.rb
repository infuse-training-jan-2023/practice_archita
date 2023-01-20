class Assignment2
    def element_at(arr, index)
        if index > arr.length or index < 0
            return -1
        end

        return arr[index]
    end

    def inclusive_range(arr, start_pos, end_pos)
        if start_pos < 0 or end_pos < 0 or start_pos > arr.length or end_pos > arr.length 
            return -1
        end

        return arr[start_pos..end_pos]
    end

    def non_inclusive_range(arr, start_pos, end_pos)
        if start_pos < 0 or end_pos < 0 or start_pos > arr.length or end_pos > arr.length
            return -1
        end
            
        return arr[start_pos..end_pos-1]
    end

    def start_and_length(arr, start_pos, length)
        if start_pos < 0 or start_pos + length > arr.length
            return -1
        end

        return arr[start_pos, length]
    end
end

# arr = [9, 5, 1, 2, 3, 4, 0,-1]
# assg2 = Assignment2.new
# puts assg2.element_at(arr, 5)
# puts assg2.inclusive_range(arr, 4, 7)
# puts assg2.non_inclusive_range(arr, 1, 3)
# puts assg2.start_and_length(arr, 2, 6)