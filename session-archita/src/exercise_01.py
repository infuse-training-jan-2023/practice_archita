from flask import Flask, request, Response
import re

app = Flask(__name__)

def validate_email(email):
    regex = r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,7}\b'
    if(re.fullmatch(regex, email)):
        return {'Message': 'Valid email'}
    return {'Message': 'Not valid email'}

@app.route('/', methods=['GET'])
def get_email():
    request_data = request.get_json()
    email = request_data['email']
    return validate_email(email)

if __name__ == '__main__':
    app.run(debug = True, port = 5001, host = '0.0.0.0')

