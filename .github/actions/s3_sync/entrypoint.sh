#!/bin/bash

set -e

echo '[profile crossaccount]

role_arn='$RUNNER_ROLE'
credential_source=Ec2InstanceMetadata' > ~/.aws/config
aws s3 sync --profile crossaccount ls #--acl public-read _site s3://$BUCKET_NAME --delete