CREATE STAGE bronze_schema.my_stage
FILE_FORMAT = (TYPE = 'CSV')
URL = 's3://your-bucket-name'
CREDENTIALS = (AWS_KEY_ID = 'your-key' AWS_SECRET_KEY = 'your-secret');
