require 'test/unit'
require_relative 'printArrayElements2'

class TestBook < Test::Unit::TestCase
    def test_array_functions_valid_case_noninclusive_range()
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        assg2 = PrintArrayElements2.new()
        assert_equal([1, 2, 3, 4, 0], assg2.non_inclusive_range(arr, 2, 7))
    end

    def test_array_functions_empty_arr_noninclusive_range()
        arr = []
        assg2 = PrintArrayElements2.new()
        assert_equal(-1, assg2.non_inclusive_range(arr, 2, 5))
    end

    def test_array_functions_invalid_start_index_noninclusive_range()
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        assg2 = PrintArrayElements2.new()
        assert_equal(-1, assg2.non_inclusive_range(arr, -1, 5))
    end

    def test_array_functions_invalid_end_index_noninclusive_range()
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        assg2 = PrintArrayElements2.new()
        assert_equal(-1, assg2.non_inclusive_range(arr, 2, 9))
    end

    def test_array_functions_valid_case_start_len()
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        assg2 = PrintArrayElements2.new()
        assert_equal([1, 2, 3, 4, 0, -1], assg2.start_and_length(arr, 2, 6))
    end

    def test_array_functions_empty_arr_start_len()
        arr = []
        assg2 = PrintArrayElements2.new()
        assert_equal(-1, assg2.start_and_length(arr, 2, 5))
    end

    def test_array_functions_invalid_start_index()
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        assg2 = PrintArrayElements2.new()
        assert_equal(-1, assg2.start_and_length(arr, -9, 4))
    end

    def test_array_functions_invalid_len()
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        assg2 = PrintArrayElements2.new()
        assert_equal(-1, assg2.start_and_length(arr, 2, 8))
    end
end
