require 'test/unit'
require_relative 'printArrayElements'

class TestBook < Test::Unit::TestCase
    def test_create_obj()
        obj = PrintArrayElements.new()
        assert obj.instance_of? PrintArrayElements
    end   
    
    def test_valid_case_element_at()
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        obj = PrintArrayElements.new()
        assert_equal(4, obj.element_at(arr, 5))
    end

    def test_index_greater_than_arr_len_element_at()
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        obj = PrintArrayElements.new()
        assert_equal(-1, obj.element_at(arr, 12))
    end

    def test_index_less_than_zero_element_at()
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        obj = PrintArrayElements.new()
        assert_equal(-1, obj.element_at(arr, -2))
    end

    def test_valid_case_inclusive_range()
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        obj = PrintArrayElements.new()
        assert_equal([1, 2, 3, 4], obj.inclusive_range(arr, 2, 5))
    end

    def test_empty_arr_inclusive_range()
        arr = []
        obj = PrintArrayElements.new()
        assert_equal(-1, obj.inclusive_range(arr, 2, 5))
    end

    def test_invalid_start_index_inclusive_range()
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        obj = PrintArrayElements.new()
        assert_equal(-1, obj.inclusive_range(arr, -1, 5))
    end

    def test_invalid_end_index_inclusive_range()
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        obj = PrintArrayElements.new()
        assert_equal(-1, obj.inclusive_range(arr, 2, 9))
    end

    def test_array_functions_valid_case_noninclusive_range()
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        obj = PrintArrayElements.new()
        assert_equal([1, 2, 3, 4, 0], obj.non_inclusive_range(arr, 2, 7))
    end

    def test_array_functions_empty_arr_noninclusive_range()
        arr = []
        obj = PrintArrayElements.new()
        assert_equal(-1, obj.non_inclusive_range(arr, 2, 5))
    end

    def test_array_functions_invalid_start_index_noninclusive_range()
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        obj = PrintArrayElements.new()
        assert_equal(-1, obj.non_inclusive_range(arr, -1, 5))
    end

    def test_array_functions_invalid_end_index_noninclusive_range()
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        obj = PrintArrayElements.new()
        assert_equal(-1, obj.non_inclusive_range(arr, 2, 9))
    end

    def test_array_functions_valid_case_start_len()
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        obj = PrintArrayElements.new()
        assert_equal([1, 2, 3, 4, 0, -1], obj.start_and_length(arr, 2, 6))
    end

    def test_array_functions_empty_arr_start_len()
        arr = []
        obj = PrintArrayElements.new()
        assert_equal(-1, obj.start_and_length(arr, 2, 5))
    end

    def test_array_functions_invalid_start_index()
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        obj = PrintArrayElements.new()
        assert_equal(-1, obj.start_and_length(arr, -9, 4))
    end

    def test_array_functions_invalid_len()
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        obj = PrintArrayElements.new()
        assert_equal(-1, obj.start_and_length(arr, 2, 8))
    end
end




