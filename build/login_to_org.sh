echo "Logging into Salesforce Org"
mkdir keys
echo $CERT_KEY | base64 -di > keys/server.key

echo "Authenticating org"
sfdx force:auth:jwt:grant --clientid $APP_KEY --jwtkeyfile keys/server.key --instanceurl "https://login.salesforce.com" --username $SF_USERNAME --setdefaultdevhubusername -a DevHub 

echo "Authenticated..." 