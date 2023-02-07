class PrintArrayElements2
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