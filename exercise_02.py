class ExerciseTwo:
    def validate(self, **kwargs) -> bool:
        if kwargs.get('index') and kwargs.get('arr'):
            if kwargs.get('index') > len(kwargs.get('arr')):
                return False
            return True

        if kwargs.get('start_pos') and kwargs.get('end_pos') and kwargs.get('arr'):
            if(kwargs.get('start_pos') > kwargs.get('end_pos') or kwargs.get('start_pos') > len(kwargs.get('arr')) or kwargs.get('end_pos') > len(kwargs.get('arr'))):
                return False
            return True

        if kwargs.get('start_pos') and kwargs.get('length') and kwargs.get('arr'):
            if(kwargs.get('start_pos') > len(kwargs.get('arr')) or kwargs.get('length') <= 0 or kwargs.get('length') > len(kwargs.get('arr'))):
                return False
            return True

    def element_at(self, arr, index) -> int:
        if self.validate(arr=arr, index=index):
            return arr[index]
        raise IndexError("Invalid index or array is empty")

    def inclusive_range(self, arr, start_pos, end_pos) -> int:
        if self.validate(arr=arr, start_pos=start_pos, end_pos=end_pos):
            return arr[start_pos:end_pos+1]
        raise IndexError("Invalid start or end index or array is empty")

    def non_inclusive_range(self, arr, start_pos, end_pos) -> int:
        if self.validate(arr=arr, start_pos=start_pos, end_pos=end_pos):
            return arr[start_pos:end_pos]
        raise IndexError("Invalid start or end index or array is empty")

    def start_and_length(self, arr, start_pos, length) -> int:
        if self.validate(arr=arr, start_pos=start_pos, length=length):
            return arr[start_pos:start_pos+length]
        raise IndexError("Invalid start index or length or array is empty")

# arr = [9, 5, 1, 2, 3, 4, 0, -1]
# arr = []
# ex2 = ExerciseTwo()
# print(ex2.element_at(arr, 13))
# print(ex2.inclusive_range(-5, -10))
# print(ex2.non_inclusive_range(3, 5))
# print(ex2.start_and_length(3, 0))