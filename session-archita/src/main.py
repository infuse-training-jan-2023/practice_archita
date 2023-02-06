from flask import Flask, Response, request
from item_actions import ItemActions
from user_actions import UserActions
import json

app = Flask(__name__)

@app.route('/', methods=['GET'])
def welcome():
    return "Hello world"

# @app.route('/item/<int:num>', methods=['GET'])
# def item(num):
#     return str(num * num)

item_actions = ItemActions()
user_actions = UserActions()

@app.route('/items', methods = ['GET'])
def get_all_items():
  items = item_actions.get_all_items()
  # print(items)
  if len(items) == 0:
    return Response("No data found", mimetype='application/json', status=500)
  return Response(json.dumps(items), mimetype='application/json', status=200)

@app.route('/item/<int:id>', methods = ['GET'])
def get_item(id):
  items = item_actions.get_item(id)
  # print(items)
  if len(items) == 0:
    return Response(f"Item {id} does not exist", mimetype='application/json', status=500)
  return Response(json.dumps(items), mimetype='application/json', status=200)

@app.route('/item', methods = ['POST'])
def add_new_item():
  request_data = request.get_json()
  item = request_data['item']
  reminder = request_data['reminder']

  added_item = item_actions.add_item(item, reminder)
  if added_item == {}:
    return Response("{'error': 'Error addding the item'}", mimetype='application/json', status=500)
  return Response(json.dumps(added_item), mimetype='application/json', status=201)

@app.route('/item/<int:id>', methods=['DELETE'])
def delete_item(id):
    items = item_actions.delete_item(id)
    # print(items)
    return Response(json.dumps(items),mimetype='application/json',status=200)

@app.route('/item/<int:id>', methods = ['PUT'])
def update_item(id):
  request_data = request.get_json()

  added_item = item_actions.update_item(id, request_data)
  if added_item == {}:
    return Response("{'error': 'Error updating the item'}", mimetype='application/json', status=500)
  return Response(json.dumps(added_item), mimetype='application/json', status=201)

@app.route('/user', methods = ['POST'])
def register_user():
  request_data = request.get_json()
  user_name = request_data['user_name']
  email_id = request_data['email_id']

  added_item = user_actions.register_user(user_name, email_id)
  if added_item == {}:
    return Response("{'error': 'Error adding the user'}", mimetype='application/json', status=500)
  return Response(json.dumps(added_item), mimetype='application/json', status=201)

@app.route('/save', methods=['GET'])
def save_items():
    item = item_actions.save_items()
    return Response(json.dumps(item),mimetype='application/json',status=200)

if __name__ == '__main__':
    app.run(debug = True, port = 5000, host = '0.0.0.0')