import pytest
from pytest_bdd import scenarios, when, then
import requests

scenarios('../features/register_user.features')

url = "http://127.0.0.1:5000/user"

@when('i want to register a user')
def register_user():
    pytest.api_response = requests.post(url, json={"user_name": "abc", "email_id": "shcjs@djsnsjcn.com"})

@then('i should get the user registered')
def check_user_registered():
    body = pytest.api_response.json()
    assert body['user name'] == 'abc'

@then('the api status code should be 201')
def check_status_code():
    assert pytest.api_response.status_code == 201

@then('the api response content should be json')
def check_content_type():
    assert pytest.api_response.headers['Content-type'] == 'application/json'
