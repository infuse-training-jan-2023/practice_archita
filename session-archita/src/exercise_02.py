from flask import Flask, request, Response
import re

app = Flask(__name__)

@app.route('/', methods=['GET'])
def validate_password():
    request_data = request.get_json()
    password = request_data['password']
    regex = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!#%*?&]{8,}$'
    if(re.fullmatch(regex, password)):
        return Response("Message: Valid password", mimetype='application/json', status=200)
    return Response("Message: Not valid password", mimetype='application/json', status=200)

if __name__ == '__main__':
    app.run(debug = True, port = 5001, host = '0.0.0.0')

