from src.exercise_02 import validate_password

valid_status = {'Message': 'Valid password'}
invalid_status = {'Message': 'Not valid password'}

def test_valid_password(mocker):
    mock = mocker.patch('src.exercise_02.validate_password', return_value = valid_status)
    ret_val = validate_password("Abc133@@")
    assert ret_val == valid_status

def test_invalid_password(mocker):
    mock = mocker.patch('src.exercise_02.validate_password', return_value = invalid_status)
    ret_val = validate_password("bob111111111111")
    assert ret_val == invalid_status