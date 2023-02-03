import pytest
from exercise_03 import Exercise_03

class Test_Exercise_03:
    def test_obj_creation():
        ex3 = Exercise_03()
        assert isinstance(ex3, Exercise_03)

    def test_valid_skip_is_non_zero():
        arr = ['Cricket', 'TT', 'Football', 'Hockey']
        ex3 = Exercise_03()
        assert ex3.skip_sports(arr, 2) == ['2:Football', '3:Hockey']

    def test_valid_skip_is_zero():
        arr = ['Cricket', 'TT', 'Football', 'Hockey']
        ex3 = Exercise_03()
        assert ex3.skip_sports(arr, 0) == ['0:Cricket', '1:TT', '2:Football', '3:Hockey']

    def test_empty_arr():
        arr = []
        with pytest.raises(IndexError, match="Invalid skip or array is empty"):
            ex3 = Exercise_03()
            assert ex3.skip_sports(arr, 3)

    def test_invalid_negative_skip():
        arr = ['Cricket', 'TT', 'Football', 'Hockey']
        with pytest.raises(IndexError, match="Invalid skip or array is empty"):
            ex3 = Exercise_03()
            assert ex3.skip_sports(arr, -3)

    def test_invalid_skip_more_than_arr_len():
        arr = ['Cricket', 'TT', 'Football', 'Hockey']
        with pytest.raises(IndexError, match="Invalid skip or array is empty"):
            ex3 = Exercise_03()
            assert ex3.skip_sports(arr, 13)