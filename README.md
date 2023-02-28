# AWS Exercises


#### Exercise 1 - Create an S3 bucket for storing logs  
- Sign up/ Sign in for AWS
- Search S3
- Click create bucket, you will be navigated to another page
- Enter a unique bucket name and select the AWS region
- Click create bucket


#### Exercise 2 - Create a Lambda function to log each invocation with the timestamp to the created S3 bucket.
- Sign up/ Sign in for AWS
- Search lamda 
- Click create fucntion, you will be navigated to another page
- Select Author from scratch
- Enter function name and select runtime python
- Click create function, you will be navigated to another page, displaying the lambda function created
- Go to configuration tab, click permissions and then click on the link under execution role section, it will open a new window of IAM
- Click add permissions, select attach policies, you will be navigated to another page
- Enter the needed policy, here it is AWSLambdaExecute
- Go back to lambda functions page and go to code tab
- Write the python script to log each invocation with the timestamp to the created S3 bucket. (Refer lambda_function.py)
- Click deploy
- Click test, you will be redirected to execution results tab where the response message is displayed


#### Exercise 3 - Create an API in API Gateway and link it to the above created lambda, so that you can invoke the lambda function via curl command/postman or programmatically.  
- Follow the steps mentioned for exercise 2
- Now go to triggers, click add trigger, you will be navigated to another page
- Select API gateway, choose Intent as create a new API, choose API type as REST API, select security mechanism as open
- Click add, a new trigger will be added and an API endpoint will be displayed. We can hit this endpoint via postman.