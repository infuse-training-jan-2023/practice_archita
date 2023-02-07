import pytest
from pytest_bdd import scenarios, when, then
import requests

scenarios('../features/get_item.features')

url = "http://127.0.0.1:5000/item/1"

@when('i search for an item')
def get_item():
    pytest.api_response = requests.get(url)

@then('i should get the item present')
def check_item_returned():
    body = pytest.api_response.json()
    assert type(body[0]) == dict

@then('the api status code should be 200')
def check_status_code():
    assert pytest.api_response.status_code == 200

@then('the api response content should be json')
def check_content_type():
    assert pytest.api_response.headers['Content-type'] == 'application/json'
