import pytest
from exercise_02 import Exercise_02

class Test_Exercise_02:
    def test_obj_creation():
        ex2 = Exercise_02()
        assert isinstance(ex2, Exercise_02)

    def test_element_at_valid_positive_index():
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        ex2 = Exercise_02()
        assert ex2.element_at(arr, 3) == 2

    def test_element_at_valid_negative_index():
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        ex2 = Exercise_02()
        assert ex2.element_at(arr, -3) == 4

    def test_element_at_empty_arr():
        arr = []
        with pytest.raises(IndexError, match="Invalid index or array is empty"):
            ex2 = Exercise_02()
            ex2.element_at(arr, 5) 

    def test_element_at_invalid_index():
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        with pytest.raises(IndexError, match="Invalid index or array is empty"):
            ex2 = Exercise_02()
            ex2.element_at(arr, 11) 

    ####################################

    def test_inclusive_range_valid_positive_indices():
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        ex2 = Exercise_02()
        assert ex2.inclusive_range(arr, 3, 6) == [2, 3, 4, 0]

    def test_inclusive_range_valid_negative_indices():
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        ex2 = Exercise_02()
        assert ex2.inclusive_range(arr, -5, -2) == [2, 3, 4, 0]

    def test_inclusive_range_empty_arr():
        arr = []
        with pytest.raises(IndexError, match="Invalid start or end index or array is empty"):
            ex2 = Exercise_02()
            ex2.inclusive_range(arr, 5, 8) 

    def test_inclusive_range_invalid_start_index_more_than_end_index():
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        with pytest.raises(IndexError, match="Invalid start or end index or array is empty"):
            ex2 = Exercise_02()
            ex2.inclusive_range(arr, 5, 3) 

    def test_inclusive_range_invalid_end_index_more_than_arr_len():
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        with pytest.raises(IndexError, match="Invalid start or end index or array is empty"):
            ex2 = Exercise_02()
            ex2.inclusive_range(arr, 5, 17) 

    ####################################

    def test_non_inclusive_range_valid_positive_indices():
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        ex2 = Exercise_02()
        assert ex2.non_inclusive_range(arr, 3, 6) == [2, 3, 4]

    def test_non_inclusive_range_valid_negative_indices():
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        ex2 = Exercise_02()
        assert ex2.non_inclusive_range(arr, -5, -2) == [2, 3, 4]

    def test_non_inclusive_range_empty_arr():
        arr = []
        with pytest.raises(IndexError, match="Invalid start or end index or array is empty"):
            ex2 = Exercise_02()
            ex2.non_inclusive_range(arr, 5, 8) 

    def test_non_inclusive_range_invalid_start_index_more_than_end_index():
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        with pytest.raises(IndexError, match="Invalid start or end index or array is empty"):
            ex2 = Exercise_02()
            ex2.non_inclusive_range(arr, 5, 3) 

    def test_non_inclusive_range_invalid_end_index_more_than_arr_len():
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        with pytest.raises(IndexError, match="Invalid start or end index or array is empty"):
            ex2 = Exercise_02()
            ex2.non_inclusive_range(arr, 5, 17) 

    ####################################

    def test_start_and_length_positive_indices():
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        ex2 = Exercise_02()
        assert ex2.start_and_length(arr, 3, 2) == [2, 3]

    def test_start_and_length_negative_index():
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        ex2 = Exercise_02()
        assert ex2.start_and_length(arr, -5, 2) == [2, 3]

    def test_start_and_length_empty_arr():
        arr = []
        with pytest.raises(IndexError, match="Invalid start index or length or array is empty"):
            ex2 = Exercise_02()
            ex2.start_and_length(arr, 5, 2) 

    def test_start_and_length_invalid_start_index():
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        with pytest.raises(IndexError, match="Invalid start index or length or array is empty"):
            ex2 = Exercise_02()
            ex2.start_and_length(arr, 15, 3) 

    def test_start_and_length_invalid_len():
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        with pytest.raises(IndexError, match="Invalid start index or length or array is empty"):
            ex2 = Exercise_02()
            ex2.start_and_length(arr, 5, 17) 