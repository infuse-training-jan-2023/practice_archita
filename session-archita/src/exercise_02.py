from flask import Flask, request, Response
import re

app = Flask(__name__)

def validate_password(password):
    regex = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!#%*?&]{8,}$'
    if(re.fullmatch(regex, password)):
        return {"Message": "Valid password"}
    return {"Message": "Not valid password"}

@app.route('/', methods=['GET'])
def validate():
    request_data = request.get_json()
    password = request_data['password']
    return validate_password(password)

if __name__ == '__main__':
    app.run(debug = True, port = 5001, host = '0.0.0.0')

