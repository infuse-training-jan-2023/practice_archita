class PrintArrayElements
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
end