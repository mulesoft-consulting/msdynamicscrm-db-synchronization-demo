MS Dynamics CRM On Demand <---> Database Account Sync
=======

> This repository contains the code for MS Dynamics to Database Account Bidirectional Synchronization.

## Demo environment configuration
- The first thing is to create an account in the MS Dynamics CRM On Demand Site.
	- Upon creation, you should have given an email address that looks something like <account>@<account>.onmicrosoft.com, save it. This will be the username to configure in the connector.
	- Pending (configure timezone in CRM Dynamics GMT-0)
- The second thing is to have an Oracle database to run the demo against. Once created, write down the IP Address of the VM.
	- Once the Oracle is running, create the account table in the demo schema already created of the Oracle. (See the Account and Credentials table for connecting to the database). The account table script is located at the GitHub repository. The link is schema.sql.
	- Change the date configuration for the Amazon instance to GMT-0 (UTC). 
		- You can use for generating testing data this: http://www.mockaroo.com/65708bf0 
- Download the project from https://github.com/mulesoft-consulting/msdynamicscrm-oracle-synchronization-demo
- Open the project in Studio
- Replace the credential for the created Database and Dynamics, it’s equivalent to Credential properties:

**# Oracle configuration**

	database.username=<database_username>
	database.password=<password>
	database.host=<host>
    database.port=<port>
	database.sid=<sid>

**# Dynamics**

	dynamics.username=<dynamics_username>@<dynamics_username>.onmicrosoft.com
	dynamics.password=<dynamics_password>
	dynamics.service.url=https://<dynamics_username>.crm.dynamics.com/XRMServices/2011/Organization.svc

- Build the deployable zip file from studio and deploy into Mule ESB 3.5.1
- Open Dynamics in a browser and log in, go to Sales → Accounts and delete the existing accounts
- Open an Oracle browser and log in and prepare the queries for select the accounts, update an existing one and insert new accounts
- Run Mule ESB
- Use the next script to execute queries for the demo in Oracle database: dynamics-db-test-script.sql

## Connectors
This demo version currently is using a beta version of the Dynamics CRM connector which is included here: https://github.com/mulesoft-consulting/msdynamicscrm-oracle-synchronization-demo/tree/master/connectors
