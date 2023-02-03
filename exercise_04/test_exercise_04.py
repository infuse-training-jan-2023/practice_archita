import pytest
from exercise_04 import Exercise_04

class Test_Exercise_04:
    def test_obj_creation(self):
        ex4 = Exercise_04()
        assert isinstance(ex4, Exercise_04)

    def test_valid_input_positive_k(self):
        ex4 = Exercise_04()
        assert ex4.count_of_subarrays_dict([1,2,3], 3) == 2

    def test_valid_input_negative_k(self):
        ex4 = Exercise_04()
        assert ex4.count_of_subarrays_dict([-7,4,-2,-1,-2], -3) == 3

    def test_valid_input_k_is_zero(self):
        ex4 = Exercise_04()
        assert ex4.count_of_subarrays_dict([-1,1,-1,1], 0) == 4
    
    def test_invalid_input_empty_arr(self):
        with pytest.raises(IndexError, match="Array is empty"):
            ex4 = Exercise_04()
            assert ex4.count_of_subarrays_dict([], 3)