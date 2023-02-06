class ExerciseThree:
    def skip_sports(self, arr, skip) -> list:
        if skip > len(arr) or skip < 0:
            raise IndexError("Invalid skip or array is empty")

        result = [f"{i}:{arr[i]}" for i in range(skip, len(arr))]
        return result

# ex3 = ExerciseThree()
# arr = ['Cricket', 'TT', 'Football', 'Hockey']
# print(ex3.skip_sports(arr, 0))