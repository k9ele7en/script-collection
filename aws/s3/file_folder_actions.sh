# sync source folder to s3 location
aws s3 sync . s3://bucket-name/folder/target

# trick to create empty folder (object actually): leave --body blank
aws s3api put-object --bucket my-bucket-name --key folder/

# put-object (file): no need to create target folder in --key
aws s3api put-object --bucket my-bucket-here --key importer/2016/01/sample/sample.txt --body ./sample.txt
