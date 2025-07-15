CREATE STAGE my_stage
FILE_FORMAT = (TYPE = 'CSV')
URL = 'gcs://your-gcs-bucket/path/'
STORAGE_INTEGRATION = my_gcs_integration
