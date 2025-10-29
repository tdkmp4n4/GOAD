#!/bin/bash

# Retrieve the role name from instance metadata
ROLE_NAME=$(curl -s http://169.254.169.254/latest/meta-data/iam/security-credentials/)

# Retrieve the credentials for the role
CREDS_JSON=$(curl -s http://169.254.169.254/latest/meta-data/iam/security-credentials/$ROLE_NAME)

# Extract values from JSON
AWS_ACCESS_KEY_ID=$(echo $CREDS_JSON | jq -r '.AccessKeyId')
AWS_SECRET_ACCESS_KEY=$(echo $CREDS_JSON | jq -r '.SecretAccessKey')
AWS_SESSION_TOKEN=$(echo $CREDS_JSON | jq -r '.Token')

# Store credentials in /root/.aws/credentials file
mkdir -p /root/.aws
cat <<EOL > /root/.aws/credentials
[goad]
aws_access_key_id = $AWS_ACCESS_KEY_ID
aws_secret_access_key = $AWS_SECRET_ACCESS_KEY
aws_session_token = $AWS_SESSION_TOKEN
EOL
