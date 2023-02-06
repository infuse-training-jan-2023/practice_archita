from exercise_01 import ExerciseOne

class TestExerciseOne:
    ex1 = ExerciseOne()

    def test_obj_creation(self):
        assert isinstance(TestExerciseOne.ex1, ExerciseOne)

    def test_valid_input_and_output(self):
        assert TestExerciseOne.ex1.serial_average('002-11.10-12.00') == '002-11.55'

    def test_valid_avg_one_digit_before_and_after_decimal(self):
        assert TestExerciseOne.ex1.serial_average('002-00.00-12.40') == '002-06.20'

    def test_invalid_input_characters(self):
        assert TestExerciseOne.ex1.serial_average('*02-0o.00-12.00') == 'Incorrect input'

    def test_invalid_input_less_len(self):
        assert TestExerciseOne.ex1.serial_average('002-00.00-1') == 'Incorrect input'

    def test_invalid_input_more_len(self):
        assert TestExerciseOne.ex1.serial_average('002-00.00-12.001111') == 'Incorrect input'



