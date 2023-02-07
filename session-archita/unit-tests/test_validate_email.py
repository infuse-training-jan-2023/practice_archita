from src.exercise_01 import validate_email

valid_status = {'Message': 'Valid email'}
invalid_status = {'Message': 'Not valid email'}

def test_valid_email(mocker):
    mock = mocker.patch('src.exercise_01.validate_email', return_value = valid_status)
    ret_val = validate_email("bob@gmail.com")
    assert ret_val == valid_status

def test_invalid_email(mocker):
    mock = mocker.patch('src.exercise_01.validate_email', return_value = invalid_status)
    ret_val = validate_email("bob@gmailcom")
    assert ret_val == invalid_status