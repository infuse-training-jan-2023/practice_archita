import pytest
from exercise_03 import ExerciseThree

class TestExerciseThree:
    ex3 = ExerciseThree()

    def test_obj_creation(self):
        assert isinstance(TestExerciseThree.ex3, ExerciseThree)

    def test_valid_skip_is_non_zero(self):
        arr = ['Cricket', 'TT', 'Football', 'Hockey']
        assert TestExerciseThree.ex3.skip_sports(arr, 2) == ['2:Football', '3:Hockey']

    def test_valid_skip_is_zero(self):
        arr = ['Cricket', 'TT', 'Football', 'Hockey']
        assert TestExerciseThree.ex3.skip_sports(arr, 0) == ['0:Cricket', '1:TT', '2:Football', '3:Hockey']

    def test_empty_arr(self):
        arr = []
        with pytest.raises(IndexError, match="Invalid skip or array is empty"):
            assert TestExerciseThree.ex3.skip_sports(arr, 3)

    def test_invalid_negative_skip(self):
        arr = ['Cricket', 'TT', 'Football', 'Hockey']
        with pytest.raises(IndexError, match="Invalid skip or array is empty"):
            assert TestExerciseThree.ex3.skip_sports(arr, -3)

    def test_invalid_skip_more_than_arr_len(self):
        arr = ['Cricket', 'TT', 'Football', 'Hockey']
        with pytest.raises(IndexError, match="Invalid skip or array is empty"):
            assert TestExerciseThree.ex3.skip_sports(arr, 13)