import pytest
from pytest_bdd import scenarios, when, then
import requests

scenarios('../features/add_item.features')

url = "http://127.0.0.1:5000/item"

@when('i want to add item')
def add_item():
    pytest.api_response = requests.post(url, json={"item": "Complete ruby exercises", "reminder": 1, "status": "Not Started"})

@then('i should get the item added')
def check_item_added():
    body = pytest.api_response.json()
    assert body == {'Message': 'Item 12 is added successfully'}

@then('the api status code should be 201')
def check_status_code():
    assert pytest.api_response.status_code == 201

@then('the api response content should be json')
def check_content_type():
    assert pytest.api_response.headers['Content-type'] == 'application/json'
