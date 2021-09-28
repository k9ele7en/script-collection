# sync data from local dags to composer env dags:
gsutil -m rsync -d -r ./dags/ gs://us-east2-james-project-bucket/dags

# run cmd composer env:
gcloud config set composer/location asia-east2
gcloud beta composer environments run <env-name> connections --help