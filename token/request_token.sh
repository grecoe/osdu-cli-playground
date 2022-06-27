# !/bin/bash

# Service Principal Data
AZURE_TENANT=YOUR_AZURE_TENENT
CLIENT_ID=YOUR_PRINCIPAL_ID
CLIENT_SECRET=YOUR_PRINCIPAL_SECRET
# Your OSDU deployment in Azure. These values need to be updated with YOUR
# service deployment name. 
NAME=platform1000
DOMAIN=energy.azure.com
PARTITION=platform1000-opendes

DATA_PARTITION=$NAME-$PARTITION
OSDU_ENDPOINT=https://$NAME.$DOMAIN
LEGAL_TAG=${DATA_PARTITION}-open-test-data
LOGIN_ENDPOINT=https://login.microsoftonline.com/${AZURE_TENANT}/oauth2/v2.0/token
SCOPE="$CLIENT_ID/.default openid profile offline_access"
URL="https://login.microsoftonline.com/${AZURE_TENANT}/oauth2/v2.0/authorize?client_id=${CLIENT_ID}&response_type=code&redirect_uri=http%3a%2f%2flocalhost%3a8080&response_mode=query&scope=${CLIENT_ID}%2f.default&state=12345&sso_reload=true"

RESPONSE=""
if [ -z $RESPONSE ]
then
  echo "***********************************************************************************"
  echo "Visit this URL in your browser and log in. The call will produce an error message,"
  echo "however, take the re-direct address you recieve - in full - and copy it. Paste the"
  echo "result in the varialbe RESPONSE above."
  echo "***********************************************************************************"
  echo $URL
  exit
fi


echo "***********************************************************************************"
echo "Retrieving a refresh token for osdu cli from your osdu instance."
echo "***********************************************************************************"

# Get REFRESH Token and set in in the .envrc file
REFRESH_TOKEN=$(curl --silent --request POST \
  --url https://login.microsoftonline.com/${AZURE_TENANT}/oauth2/v2.0/token \
  --header "content-type: application/x-www-form-urlencoded" \
  --data "grant_type=authorization_code" \
  --data "client_id=${CLIENT_ID}" \
  --data "client_secret=${CLIENT_SECRET}" \
  --data "code=$(echo $RESPONSE | cut -d "=" -f 2 | cut -d "&" -f 1)" \
  --data "scope=$CLIENT_ID/.default openid profile offline_access" \
  --data "redirect_uri=http%3A%2F%2Flocalhost%3a8080" | jq -r .refresh_token)

echo "YOUR REFRESH TOKEN IS BELOW, use this for osdu config update:"
echo ""
echo $REFRESH_TOKEN
echo ""
