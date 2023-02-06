import pytest
from pytest_bdd import scenarios, when, then
import requests, json

scenarios('../features/update_item.features')

url = "http://127.0.0.1:5000/item/8"

@when('i want to update item')
def update_item():
    pytest.api_response = requests.put(url, json={"status": "Started"})

@then('i should get the item updated')
def check_item_updated():
    body = pytest.api_response.json()
    assert body == {'Message': 'Item 8 updated successfully'}

@then('the api status code should be 201')
def check_status_code():
    assert pytest.api_response.status_code == 201

@then('the api response content should be json')
def check_content_type():
    assert pytest.api_response.headers['Content-type'] == 'application/json'
