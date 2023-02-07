import pytest
from pytest_bdd import scenarios, when, then
import requests

scenarios('../features/delete_item.features')

url = "http://127.0.0.1:5000/item/9"

@when('i want to delete item')
def delete_item():
    pytest.api_response = requests.delete(url)

@then('i should get the item deleted')
def check_item_added():
    body = pytest.api_response.json()
    assert body == {'Message': 'Item 9 deleted successfully'}

@then('the api status code should be 200')
def check_status_code():
    assert pytest.api_response.status_code == 200

@then('the api response content should be json')
def check_content_type():
    assert pytest.api_response.headers['Content-type'] == 'application/json'
