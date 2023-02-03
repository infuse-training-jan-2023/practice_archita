import re, math

class Exercise_01:
    def serial_average(self, input) -> str:
        valid_pattern = '^[0-9]{3}-[0-9]{2}.[0-9]{2}-[0-9]{2}.[0-9]{2}$'
        is_valid = re.match(valid_pattern, input)

        if is_valid:
            avg = (float(input[4:9]) + float(input[10:])) / 2
            res = input[0:4] + '%05.02f' % (math.ceil(avg * 100) / 100)
            return res
        
        return 'Incorrect input'


# ex1 = Exercise_01()
# print(ex1.serial_average('002-00.00-12.001111'))
