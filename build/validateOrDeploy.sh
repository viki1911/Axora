#!/bin/bash

# Exit if a failure occurs so that errors are surfaced in the deployment tool
set -e

while getopts u:v:t: option; do
    case "${option}" in
        u) USERNAME=${OPTARG};;
        v) CHECK_ONLY=${OPTARG};;
        t) TEST_RUN=${OPTARG};;
    esac
done

echo "Validation/Deployment script started."
echo "Validation only: $CHECK_ONLY"
echo "Test level: $TEST_RUN"

echo "Converting to Metadata API format..."
sfdx force:source:convert --outputdir src

#using force:mdapi:deploy and not force:source:deploy as this allows to wait until done (-w -1) 
mdapi_deploy="sfdx force:mdapi:deploy --deploydir src/ --wait -1 --testlevel ${TEST_RUN} --targetusername ${USERNAME}"
if [ $CHECK_ONLY = true ]; then
    mdapi_deploy="${mdapi_deploy} --checkonly"
fi

echo $mdapi_deploy

eval $mdapi_deploy
