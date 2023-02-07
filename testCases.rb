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
end




