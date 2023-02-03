class Exercise_02:
    def element_at(self, arr, index):
        if index > len(arr):
            raise IndexError("Invalid index or array is empty")
        return arr[index]

    def inclusive_range(self, arr, start_pos, end_pos) -> int:
        if(start_pos > end_pos or start_pos > len(arr) or end_pos > len(arr)):
            raise IndexError("Invalid start or end index or array is empty")
        return arr[start_pos:end_pos+1]

    def non_inclusive_range(self, arr, start_pos, end_pos) -> int:
        if(start_pos > end_pos or start_pos > len(arr) or end_pos > len(arr)):
            raise IndexError("Invalid start or end index or array is empty")
        return arr[start_pos:end_pos]

    def start_and_length(self, arr, start_pos, length) -> int:
        if(start_pos > len(arr) or length <= 0 or length > len(arr)):
            raise IndexError("Invalid start index or length or array is empty")
        return arr[start_pos:start_pos+length]

# arr = [9, 5, 1, 2, 3, 4, 0, -1]
# arr = []
# ex2 = Exercise_02(arr)
# print(ex2.element_at(6))
# print(ex2.inclusive_range(-5, -10))
# print(ex2.non_inclusive_range(3, 5))
# print(ex2.start_and_length(3, 0))