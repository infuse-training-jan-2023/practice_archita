require 'test/unit'
require_relative 'assignment_1'
require_relative 'assignment_2'
require_relative 'assignment_3'
require_relative 'assignment_4'
require_relative 'assignment_5'
require_relative 'assignment_6'

class TestBook < Test::Unit::TestCase
    def test_create_assg1_obj
        assg1 = Assignment1.new()
        assert assg1.instance_of? Assignment1
    end    
    
    def test_create_assg2_obj
        assg2 = Assignment2.new()
        assert assg2.instance_of? Assignment2
    end    
    
    def test_create_assg3_obj
        assg3 = Assignment3.new()
        assert assg3.instance_of? Assignment3
    end

    def test_create_assg4_obj
        assg4 = Assignment4.new()
        assert assg4.instance_of? Assignment4
    end

    def test_create_assg5_obj
        assg5 = Assignment5.new()
        assert assg5.instance_of? Assignment5
    end

    def test_create_assg6_obj
        assg6 = Assignment6.new()
        assert assg6.instance_of? Assignment6
    end

    def test_serial_average_valid_case()
        assg1 = Assignment1.new()
        assert_equal("002-21.93", assg1.serial_average("002-16.85-27.00"))      
    end

    def test_serial_average_one_digit()
        assg1 = Assignment1.new()
        assert_equal("002-08.00", assg1.serial_average("002-01.00-15.00"))
    end

    def test_serial_average_one_value_before_after_decimal()
        assg1 = Assignment1.new()
        assert_equal("002-02.50", assg1.serial_average("002-02.00-03.00"))     
    end

    def test_serial_average_no_decimal_values()
        assg1 = Assignment1.new()
        assert_equal("002-15.00", assg1.serial_average("002-10.00-20.00"))       
    end

    def test_serial_average_more_than_actual_len()
        assg1 = Assignment1.new()
        assert_equal("Incorrect serial no.", assg1.serial_average("0025-10.900-20.00"))      
    end

    def test_serial_average_less_than_actual_len()
        assg1 = Assignment1.new()
        assert_equal("Incorrect serial no.", assg1.serial_average("04-10.00-20.00"))     
    end

    def test_serial_average_alphabets()
        assg1 = Assignment1.new()
        assert_equal("Incorrect serial no.", assg1.serial_average("asha-16.85-27.00"))      
    end

    def test_serial_average_empty()
        assg1 = Assignment1.new()
        assert_equal("Incorrect serial no.", assg1.serial_average(""))     
    end
    
    # def test_serial_average()
    #     assg1 = Assignment1.new()
    #     assert_equal("002-21.93", assg1.serial_average("002-16.85-27.00"))
    #     assert_equal("002-08.00", assg1.serial_average("002-01.00-15.00"))
    #     assert_equal("002-02.50", assg1.serial_average("002-02.00-03.00"))
    #     assert_equal("002-15.00", assg1.serial_average("002-10.00-20.00"))
    #     assert_equal("Incorrect serial no.", assg1.serial_average("0024-10.00-20.00"))
    #     assert_equal("Incorrect serial no.", assg1.serial_average("04-10.00-20.00"))
    #     assert_equal("Incorrect serial no.", assg1.serial_average("002*10.00*20.00")) 
    #     assert_equal("Incorrect serial no.", assg1.serial_average("00210.0020.00")) 
    #     assert_equal("Incorrect serial no.", assg1.serial_average("002-1.00-20.00"))        
    #     assert_equal("Incorrect serial no.", assg1.serial_average("002-10.00-2.000"))        
    #     assert_equal("Incorrect serial no.", assg1.serial_average("002-100.0-0.900"))        
    # end

    def test_array_functions_valid_case()
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        assg2 = Assignment2.new()
        assert_equal(4, assg2.element_at(arr, 5))
    end

    def test_array_functions_valid_case_element_at()
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        assg2 = Assignment2.new()
        assert_equal(4, assg2.element_at(arr, 5))
    end

    def test_array_functions_index_greater_than_arr_len_element_at()
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        assg2 = Assignment2.new()
        assert_equal(-1, assg2.element_at(arr, 12))
    end

    def test_array_functions_index_less_than_zero_element_at()
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        assg2 = Assignment2.new()
        assert_equal(-1, assg2.element_at(arr, -2))
    end

    def test_array_functions_valid_case_inclusive_range()
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        assg2 = Assignment2.new()
        assert_equal([1, 2, 3, 4], assg2.inclusive_range(arr, 2, 5))
    end

    def test_array_functions_empty_arr_inclusive_range()
        arr = []
        assg2 = Assignment2.new()
        assert_equal(-1, assg2.inclusive_range(arr, 2, 5))
    end

    def test_array_functions_invalid_start_index_inclusive_range()
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        assg2 = Assignment2.new()
        assert_equal(-1, assg2.inclusive_range(arr, -1, 5))
    end

    def test_array_functions_invalid_end_index_inclusive_range()
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        assg2 = Assignment2.new()
        assert_equal(-1, assg2.inclusive_range(arr, 2, 9))
    end

    def test_array_functions_valid_case_noninclusive_range()
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        assg2 = Assignment2.new()
        assert_equal([1, 2, 3, 4, 0], assg2.non_inclusive_range(arr, 2, 7))
    end

    def test_array_functions_empty_arr_noninclusive_range()
        arr = []
        assg2 = Assignment2.new()
        assert_equal(-1, assg2.non_inclusive_range(arr, 2, 5))
    end

    def test_array_functions_invalid_start_index_noninclusive_range()
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        assg2 = Assignment2.new()
        assert_equal(-1, assg2.non_inclusive_range(arr, -1, 5))
    end

    def test_array_functions_invalid_end_index_noninclusive_range()
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        assg2 = Assignment2.new()
        assert_equal(-1, assg2.non_inclusive_range(arr, 2, 9))
    end

    def test_array_functions_valid_case_start_len()
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        assg2 = Assignment2.new()
        assert_equal([1, 2, 3, 4, 0, -1], assg2.start_and_length(arr, 2, 6))
    end

    def test_array_functions_empty_arr_start_len()
        arr = []
        assg2 = Assignment2.new()
        assert_equal(-1, assg2.start_and_length(arr, 2, 5))
    end

    def test_array_functions_invalid_start_index()
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        assg2 = Assignment2.new()
        assert_equal(-1, assg2.start_and_length(arr, -9, 4))
    end

    def test_array_functions_invalid_len()
        arr = [9, 5, 1, 2, 3, 4, 0, -1]
        assg2 = Assignment2.new()
        assert_equal(-1, assg2.start_and_length(arr, 2, 8))
    end

    # def test_array_functions()
    #     arr = [9, 5, 1, 2, 3, 4, 0, -1]
    #     assg2 = Assignment2.new()
    #     assert_equal(4, assg2.element_at(arr, 5))
    #     assert_equal(-1, assg2.element_at(arr, 12))
    #     assert_equal(-1, assg2.element_at(arr, -2))
    #     assert_equal([1, 2, 3, 4], assg2.inclusive_range(arr, 2, 5))
    #     assert_equal([9, 5, 1, 2, 3, 4], assg2.inclusive_range(arr, 0, 5))
    #     assert_equal([1, 2, 3, 4, 0, -1], assg2.inclusive_range(arr, 2, 7))
    #     assert_equal(-1, assg2.inclusive_range(arr, 2, 9))
    #     assert_equal(-1, assg2.inclusive_range(arr, -1, 5))
    #     assert_equal(-1, assg2.inclusive_range(arr, 1, -5))
    #     assert_equal(-1, assg2.inclusive_range(arr, 11, 5))
    #     assert_equal([1, 2, 3, 4, 0], assg2.non_inclusive_range(arr, 2, 7))
    #     assert_equal([9, 5, 1, 2], assg2.non_inclusive_range(arr, 0, 4))
    #     assert_equal(-1, assg2.non_inclusive_range(arr, 2, 9))
    #     assert_equal(-1, assg2.non_inclusive_range(arr, -1, 5))
    #     assert_equal(-1, assg2.non_inclusive_range(arr, 3, -5))
    #     assert_equal(-1, assg2.non_inclusive_range(arr, 13, 4))
    #     assert_equal([1, 2, 3, 4, 0, -1], assg2.start_and_length(arr, 2, 6))
    #     assert_equal([9, 5, 1, 2], assg2.start_and_length(arr, 0, 4))
    #     assert_equal(-1, assg2.start_and_length(arr, 2, 8))
    #     assert_equal(-1, assg2.start_and_length(arr, -9, 4))
    # end

    def test_hash_add()
        assg3 = Assignment3.new()
        assert_equal({543121=>100}, assg3.add_hash(543121, 100))         
    end

    def test_hash_remove_even_keys()
        assg3 = Assignment3.new()   
        assg3.add_hash(543121, 100)
        assg3.add_hash(78, 657)
        assg3.add_hash(:jkl, "yyy")
        assg3.add_hash('onp', 'ddd')
        assert_equal({543121=>100}, assg3.remove_hash())  
    end

    def test_hash_remove_non_int_keys()
        assg3 = Assignment3.new()   
        assg3.add_hash(543121, 100)
        assg3.add_hash(:jjj, "yyy")
        assg3.add_hash('uuu', 'ddd')
        assert_equal({543121=>100}, assg3.remove_hash())  
    end

    # def test_hash_program()
    #     assg3 = Assignment3.new()
    #     assert_equal({543121=>100}, assg3.add_hash(543121, 100))        
    #     assert_equal({543121=>100, 78=>657}, assg3.add_hash(78, 657))        
    #     assert_equal({543121=>100, 78=>657, :jkl=>"yyy"}, assg3.add_hash(:jkl, "yyy"))        
    #     assert_equal({543121=>100, 78=>657, :jkl=>"yyy", "onp"=>"ddd"}, assg3.add_hash('onp', 'ddd'))        
    #     assert_equal({543121=>100}, assg3.remove_hash())  

    #     assg3_2 = Assignment3.new()
    #     assg3_2.add_hash(190, 11)             
    #     assg3_2.add_hash(78, 657) 
    #     assert_equal({}, assg3_2.remove_hash())  
    # end

    def test_skip_array_elements_valid_case()
        assg4 = Assignment4.new()
        assert_equal(["3: Football", "4: Hockey"], assg4.skip_sports(['Cricket', 'TT', 'Football', 'Hockey'], 2))
    end

    def test_skip_array_elements_empty_arr()
        assg4 = Assignment4.new()
        assert_equal(-1, assg4.skip_sports([], 2))
    end

    def test_skip_array_elements_skip_more_than_arr_len()
        assg4 = Assignment4.new()
        assert_equal(-1, assg4.skip_sports(['Cricket', 'TT', 'Football', 'Hockey'], 7))
    end

    def test_skip_array_elements_skip_less_than_zero()
        assg4 = Assignment4.new()
        assert_equal(-1, assg4.skip_sports(['Cricket', 'TT', 'Football', 'Hockey'], -2))
    end

    # def test_skip_array_elements()
    #     assg4 = Assignment4.new()
    #     assert_equal(["3: Football", "4: Hockey"], assg4.skip_sports(['Cricket', 'TT', 'Football', 'Hockey'], 2))
    #     assert_equal(["1: Cricket", "2: TT", "3: Football", "4: Hockey"], assg4.skip_sports(['Cricket', 'TT', 'Football', 'Hockey'], 0))
    #     assert_equal(-1, assg4.skip_sports(['Cricket', 'TT', 'Football', 'Hockey'], 7))
    #     assert_equal(-1, assg4.skip_sports(['Cricket', 'TT', 'Football', 'Hockey'], -2))
    #     assert_equal(-1, assg4.skip_sports([], 2))
    #     assert_equal([], assg4.skip_sports(['Cricket'], 1))
    # end

    def test_change_JSON_valid_case()
        assg5 = Assignment5.new()
        assert_equal("./person.json modified successfully!", assg5.changingJSON('./person.json'))
    end

    def test_change_JSON_non_existing_file()
        assg5 = Assignment5.new()
        assert_equal("Error!", assg5.changingJSON('./demo.json'))
    end

    def test_change_JSON_empty_ip_file()
        assg5 = Assignment5.new()
        assert_equal("File is empty", assg5.changingJSON('./demo2.json'))
    end

    def test_encoding_valid_case()
        assg6 = Assignment6.new()
        assert_equal("./content.txt encoded successfully!", assg6.encode('./content.txt'))
    end

    def test_encoding_non_existing_ip_file()
        assg6 = Assignment6.new()
        assert_equal("Error!", assg6.encode('./demo.txt'))
    end

    def test_encoding_empty_ip_file()
        assg6 = Assignment6.new()
        assert_equal("File is empty", assg6.encode('./demo2.txt'))
    end

    def test_encoding_valid_file_content()
        data = "Originally, John Doe was a sham name used to indicate any plaintiff in anaction of ejectment (a legal action to regain property) in civil court [ \u201CdGhlIHN0cmluZyB0aGF0IHdpbGwgYmUgYmFzZSBlbmNvZGVk \u201D]. Richard Roe was the counterpart, toindicate the defendant. These fake names were used in delicate legal matters,a practice that was abolished in English law in 1852."
        assert_equal(data, File.read('./archita.txt').force_encoding("utf-8"))
    end
end




