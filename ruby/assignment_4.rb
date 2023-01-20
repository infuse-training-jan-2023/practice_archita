class Assignment4
    def skip_sports(arr, skip)
        if skip > arr.length or skip < 0 or arr.length == 0
            return -1
        end
        
        res_arr = []
        for i in skip..arr.length-1
            res_arr.push("#{i+1}: #{arr[i]}")
        end
    
        return res_arr
    end
end

# assg4 = Assignment4.new()
# print assg4.skip_sports(['Cricket', 'TT', 'Football', 'Hockey'], 0)