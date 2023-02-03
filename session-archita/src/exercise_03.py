from flask import Flask,  Response
import requests

app = Flask(__name__)

@app.route('/<num>', methods=['GET'])
def validate_input_and_fetch_data(num):
    if num.isnumeric() and int(num) in range(1, 200):
        data = requests.get(f"https://jsonplaceholder.typicode.com/todos/{num}")
        return Response(data, mimetype='application/json', status=200)
    return Response(f"Error: Invalid input {num}", mimetype='application/json', status=500)

if __name__ == '__main__':
    app.run(debug = True, port = 5001, host = '0.0.0.0')

