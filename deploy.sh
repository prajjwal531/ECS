#!/bin/bash

#stop on error
set +e

#List of regions where we will upload zip files
AccountId=$(aws sts get-caller-identity|jq -r .Account)
echo $AccountId
aws ecr create-repository --repository-name nodewebapp
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $AccountId.dkr.ecr.us-east-1.amazonaws.com
docker build --build-arg secret=prajjwal -t nodewebapp .
docker tag nodewebapp:latest $AccountId.dkr.ecr.us-east-1.amazonaws.com/nodewebapp:latest
docker push $AccountId.dkr.ecr.us-east-1.amazonaws.com/nodewebapp:latest

aws cloudformation deploy --template-file ./cfn.yml --capabilities CAPABILITY_NAMED_IAM \
        --stack-name aws-farget-node-web-app --parameter-overrides SubnetA="subnet-d316a2ed" SubnetB="subnet-e1dfefab" VPC="vpc-15c17d6f" 
