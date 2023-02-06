from src.exercise_03 import validate_input

valid_status = {
    'data': {    
        "userId": 10,
        "id": 199,
        "title": "numquam repellendus a magnam",
        "completed": True
    },
    'Message': 'Valid input'

}
invalid_status = {'Message': 'Invalid input'}

def test_valid_input(mocker):
    mock = mocker.patch('src.exercise_03.validate_input', return_value = valid_status)
    ret_val = validate_input("199")
    assert ret_val == valid_status

def test_invalid_input(mocker):
    mock = mocker.patch('src.exercise_03.validate_input', return_value = invalid_status)
    ret_val = validate_input("700")
    assert ret_val == invalid_status

def test_invalid_input_str(mocker):
    mock = mocker.patch('src.exercise_03.validate_input', return_value = invalid_status)
    ret_val = validate_input("sdfhbj")
    assert ret_val == invalid_status