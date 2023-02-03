from exercise_01 import Exercise_01

class Test_Exercise_01:
    def test_obj_creation():
        ex1 = Exercise_01()
        assert isinstance(ex1, Exercise_01)

    def test_valid_input_and_output():
        ex1 = Exercise_01()
        assert ex1.serial_average('002-11.10-12.00') == '002-11.55'

    def test_valid_avg_one_digit_before_and_after_decimal():
        ex1 = Exercise_01()
        assert ex1.serial_average('002-00.00-12.40') == '002-06.20'

    def test_invalid_input_characters():
        ex1 = Exercise_01()
        assert ex1.serial_average('*02-0o.00-12.00') == 'Incorrect input'

    def test_invalid_input_less_len():
        ex1 = Exercise_01()
        assert ex1.serial_average('002-00.00-1') == 'Incorrect input'

    def test_invalid_input_more_len():
        ex1 = Exercise_01()
        assert ex1.serial_average('002-00.00-12.001111') == 'Incorrect input'



