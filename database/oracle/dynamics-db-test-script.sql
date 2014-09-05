
-- Delete step: Clear account table
delete from account;

-- Select Step: Select the existing accounts
select id,name,phone, accountnumber, dynamicsid from account

-- Insert step: Insert new accounts
insert into account (name, description, phone, accountnumber) values ('Abata', 'Court', '9-(406)859-7828', '465346611-4');
insert into account (name, description, phone, accountnumber) values ('Meedoo', 'Avenue', '7-(628)740-8713', '463727328-5');
insert into account (name, description, phone, accountnumber) values ('Reallinks', 'Parkway', '2-(901)343-6902', '623817759-4');
insert into account (name, description, phone, accountnumber) values ('Quinu', 'Plaza', '1-(298)967-9395', '300694161-6');
insert into account (name, description, phone, accountnumber) values ('Bubblemix', 'Lane', '8-(791)247-3358', '352277733-6');

-- Update step: Update an existing account
update account set	phone = '{phone_number}',accountnumber = '{account_number}',lastmodifieddate= sysdate where name = '{name}'

