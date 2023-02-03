from flask import Flask, request, Response
import re

app = Flask(__name__)

@app.route('/', methods=['GET'])
def validate_email():
    request_data = request.get_json()
    email = request_data['email']
    regex = r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,7}\b'
    if(re.fullmatch(regex, email)):
        return Response("Message: Valid email", mimetype='application/json', status=200)
    return Response("Message: Not valid email", mimetype='application/json', status=200)

if __name__ == '__main__':
    app.run(debug = True, port = 5001, host = '0.0.0.0')

