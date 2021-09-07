# Axora Salesforce CI/CD Repo


This repository contains the source metadata for the Axora Salesforce implementation.

## Document will be attached here
This tool follows a defined system for deploying through Salesforce enviroments, further details of the deployment process and the requirements to install for developers to commit to the repository can be found at in the above document.
All development will be checked by static analysis on each commit so the development best practices should be used by developers and configuration consultants. The best practices document can be found in the technical standards document.

## Technical standards:


### Initial set up


### Initial Deployment to Scratch Org

Step 1 : sfdx force:org:create -s -f config/project-scratch-def.json --setdefaultusername -d 7 -a scratchorgnamehere
Step 2 : sfdx force:source:push -f
Step 3 : sfdx force:org:open

Scratch Orgs exist for 7 days by default. Please change `-d 7` to `-d 30` to extend the duration to 30 days.

Optionally, you can import a standard set of pre-defined test data (Accounts, Opportunities) by following the following command:

sfdx force:data:tree:import --plan config/data-source/data-import-plan.json


### Retrieval of changes from Scratch Org

sfdx force:source:status
sfdx force:source:pull -f



## Onboarding Steps

1.  SFDX process / trailhead: https://trailhead.salesforce.com/en/content/learn/modules/sfdx_dev_model/sfdx_dev_model_release
2.  Install SFDX: https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_install_cli.htm
3.  Install GitHub: 
4.  Read through our process: 
5.  Clone Axora repository
6.  SFDX command cheat sheet: https://gist.github.com/Xixiao007/e22aad45caf67df33aeafae085810570


