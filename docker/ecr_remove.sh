# delete untagged images ECR

IMAGES_TO_DELETE=$( aws ecr list-images --region $region --repository-name $image --filter "tagStatus=UNTAGGED" --query 'imageIds[*]' --output json )

aws ecr batch-delete-image --region $region --repository-name $image --image-ids "$IMAGES_TO_DELETE" || true
