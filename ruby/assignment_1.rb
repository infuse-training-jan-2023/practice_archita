class Assignment1
    def serial_average(serial_no)
        # todo regular expression
        # if serial_no.length != 15 or serial_no[3] != '-' or serial_no[9] != '-' or serial_no[6] != '.' or  serial_no[12] != '.'
        #     return "Incorrect serial no."
        # end
        if !serial_no.match(/[0-9]{3}-[0-9]{2}.[0-9]{2}-[0-9]{2}.[0-9]{2}/)
            return "Incorrect serial no."
        end

        avg = ((serial_no[4, 5].to_f + serial_no[10, 5].to_f) / 2).round(2)
        return serial_no[0,3] + '-' + '%05.2f'%avg
    end
end

# ab = Assignment1.new()
# puts ab.serial_average("002-16.85-27.00")
