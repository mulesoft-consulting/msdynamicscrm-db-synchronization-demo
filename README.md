Demo: MS Dynamics CRM On Demand to Dabatase Synchronization
=======

This repository contains the code for MS Dynamics CRM On Demand to Database Account Bidirectional Synchronization.

## Summary
This demo show how easy is to integrate mule with MS Dynamics CRM On Demand. This would be implemented throw the synchronization between the accounts from MS Dynamics CRM to DB and DB to MS Dynamics CRM. The synchronization will be done in batch operation started by polling. This means that periodically the processes will be trigger to synchronize the changes between endpoints.

## Demo environment configuration
- The first thing is to create a trial account in the [MS Dynamics CRM Free Trial](http://www.microsoft.com/en-us/dynamics/crm-free-trial-overview.aspx). Once account is created you can sign in **https://{dynamics_company_name}.crm2.dynamics.com** using the first option for Microsoft Online Services.
	- Upon creation, you should have given an email address that looks something like {dynamics_username}@{dynamics_company_name}.onmicrosoft.com, save it. This will be the username to configure in the connector.
	- Pending (configure timezone in CRM Dynamics GMT-0)
- The second thing is to have an Oracle database to run the demo against. Once created, write down the IP Address of the VM.
	- Once the Oracle is running, create the account table in the demo schema already created of the Oracle. (See the Account and Credentials table for connecting to the database). The account table script is located at the GitHub repository. The link is [schema.sql](https://github.com/mulesoft-consulting/msdynamicscrm-oracle-synchronization-demo/blob/master/database/oracle/schema.sql).
	- Change the date configuration for the oracle host to GMT-0 (UTC). 
		- You can use for generating testing data this: http://www.mockaroo.com/65708bf0 
- Download the project
- Open the project in Studio
- Replace the credential for the created Database and Dynamics, it’s equivalent to [Credential properties](https://github.com/mulesoft-consulting/msdynamicscrm-oracle-synchronization-demo/blob/master/code/src/main/resources/credentials.properties):

**# Oracle configuration**

	database.username=<database_username>
	database.password=<password>
	database.host=<host>
    database.port=<port>
	database.sid=<sid>

**# Dynamics**

	dynamics.username=<dynamics_username>@<dynamics_company_name>.onmicrosoft.com
	dynamics.password=<dynamics_password>
	dynamics.service.url=https://<dynamics_company_name>.crm.dynamics.com/XRMServices/2011/Organization.svc

- Build the deployable zip file from studio and deploy into Mule ESB 3.5.1
- Open Dynamics in a browser and log in, go to Sales → Accounts and delete the existing accounts
- Open an Oracle browser and log in and prepare the queries for select the accounts, update an existing one and insert new accounts
- Run Mule ESB
- Use the next script to execute queries for the demo in Oracle database: [dynamics-db-test-script.sql](https://github.com/mulesoft-consulting/msdynamicscrm-oracle-synchronization-demo/blob/master/database/oracle/dynamics-db-test-script.sql)

## Scenarios
Once you have the environment running these are the scenarios you can execute:

Synchronize

- New accounts from DB to Dynamics
- Account changes from DB to Dynamics
- New accounts from Dynamics to DB
- Account changes from Dynamics to DB


## Notes
- Don't use this beta connector in maven projects, so far it doesn't work
- The synchronization depends on timezone configuration. So, database, esb server and dynamics should have the same timezone.

## Versions & Connectors
This demo is meant to be run with the 3.5.1 runtime in ESB and uses available connectors that you need to have installed if you want to run it localy. 

The connector list is:

1. MS Dynamic connector  1.8.4 beta (Includes in /connectors)
