import json
import calendar
import time
import boto3

s3 = boto3.client('s3')
    
def lambda_handler(event, context):
    current_GMT = time.gmtime()
    time_stamp = calendar.timegm(current_GMT)

    try:
        response = s3.put_object(Bucket="exercise-1-logs", Key=f'{time_stamp}.txt', Body=str(time_stamp))
        return {
            "statusCode": 200,
            "body": json.dumps("Success")
        }
    except Exception as e:
        return {"msg": f"{e}"}
