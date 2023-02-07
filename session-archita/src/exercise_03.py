from flask import Flask,  Response
import requests

app = Flask(__name__)

def validate_input(num):
    if num.isnumeric() and int(num) in range(1, 201):
        data = requests.get(f"https://jsonplaceholder.typicode.com/todos/{num}")
        return {'data': data.json(), 'Message': 'Valid input'}
    return {"Message": "Invalid input"}

@app.route('/<num>', methods=['GET'])
def fetch_data(num):
    return validate_input(num)

if __name__ == '__main__':
    app.run(debug = True, port = 5001, host = '0.0.0.0')

