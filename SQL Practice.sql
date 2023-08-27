-- Change the column name Unamed: 0 to Org_id and set it as the primary key
-- ALTER TABLE sdl.aven_organization CHANGE `Unnamed: 0` Org_id int not null primary key;

-- Created a new column phone_nuumber in existing table
-- ALTER TABLE sdl.aven_organization add phone_number varchar(30);

-- Updated the column name phone_number with Org_id=1
-- update sdl.aven_organization set phone_number='1234545346' where Org_id=1;

-- Delete the newly created column phone_number
-- ALTER TABLE sdl.aven_organization drop column phone_number;

-- Show the top two data from the table
-- SELECT * FROM sdl.aven_organization LIMIT 3;
-- SELECT * FROM sdl.aven_organization ORDER BY org_id DESC LIMIT 3;


-- shows the description of the columns in the table with its data types etc
-- desc sdl.aven_organization

-- retrives al;l the rows from the table where ACCOUNT_STATUS_DESC=NULL
-- select * from sdl.aven_organization where ACCOUNT_STATUS_DESC=null;

-- retives all the rows from the table where Org_id is between 5 and 15
-- select * from sdl.aven_organization where Org_id between 5 and 15;

-- difference between the "REVOLVING_BALANCE" and "REVOLVING_PRINCIPAL" columns in the table and aliases the result as "INTEREST".
-- select (REVOLVING_BALANCE-REVOLVING_PRINCIPAL) as INTEREST from sdl.aven_organization;

-- create a new table interest and the values of the columns is written as the difference of the two columns
-- alter table sdl.aven_organization add column INTEREST float4;
-- update sdl.aven_organization set INTEREST=(REVOLVING_BALANCE-REVOLVING_PRINCIPAL);

-- to know the number of record which have houseCarnary in HOME_AVM_SOURCE column
-- select count(*) as number_of_record from sdl.aven_organization where HOME_AVM_SOURCE='houseCanary';

-- select the maximum value in the  associated column from the table
-- select max(GROSS_ANNUAL_INCOME) from sdl.aven_organization;

-- select the minimum value in the  associated column from the table
-- select min(GROSS_ANNUAL_INCOME) from sdl.aven_organization;

-- ALTER TABLE sdl.aven_organization add stPhone varchar(30);
-- update sdl.aven_organization set stPhone='9861546865' where Org_id=1;
-- update sdl.aven_organization set stPhone='9808457835' where Org_id=2;

-- having groups the results by HOME_AVM_SOURCE and filters the groups to only include those with a count of HOME_AVM_SOURCE greater than 0. 
-- select count(HOME_AVM_SOURCE),HOME_AVM_SOURCE from sdl.aven_organization group by HOME_AVM_SOURCE having count(HOME_AVM_SOURCE)>0; 

-- covert the string data type of the given column into date data type 
-- SELECT CAST(ACCOUNT_OPEN_DATE AS date) AS converted_date FROM sdl.aven_organization;

-- CASE
-- SELECT Org_id,ACCOUNT_OPEN_DATE, CREDIT_LIMIT, 
--     CASE
--         WHEN CREDIT_LIMIT < 20000 THEN 'Non Priority'
--         WHEN CREDIT_LIMIT BETWEEN 20000 AND 240000 THEN 'Medium Priority'
--         ELSE 'High Priority'
--     END AS Client_Priority
-- FROM sdl.aven_organization
-- WHERE CREDIT_LIMIT IS NOT NULL
-- ORDER BY CREDIT_LIMIT;

-- Partition by
-- SELECT Org_id, ACCOUNT_OPEN_DATE, CREDIT_LIMIT,
--     CASE
--         WHEN CREDIT_LIMIT < 20000 THEN 'Non Priority'
--         WHEN CREDIT_LIMIT BETWEEN 20000 AND 240000 THEN 'Medium Priority'
--         ELSE 'High Priority'
--     END AS Client_Priority,
--     COUNT(*) OVER (PARTITION BY
--         CASE
--             WHEN CREDIT_LIMIT < 20000 THEN 'Non Priority'
--             WHEN CREDIT_LIMIT BETWEEN 20000 AND 240000 THEN 'Medium Priority'
--             ELSE 'High Priority'
--         END) AS Priority_Count
-- FROM sdl.aven_organization WHERE CREDIT_LIMIT ORDER BY CREDIT_LIMIT;

-- Simple partition example
-- SELECT Org_id, ACCOUNT_OPEN_DATE, ACCOUNT_STATUS_DESC,
-- COUNT(ACCOUNT_STATUS_DESC) OVER (PARTITION BY ACCOUNT_STATUS_DESC) AS TotalStatus
-- FROM sdl.aven_organization;

-- UION
-- select Org_id,ACCOUNT_OPEN_DATE from sdl.aven_organization union select stid, stName from sdl.new_table; 

-- VIEW TABLE
-- use sdl;
-- CREATE VIEW Info AS SELECT Org_id, GROSS_ANNUAL_INCOME, ACCOUNT_STATUS_DESC FROM aven_organization;
-- select * from Info;


-- RANK()
-- select Org_id,CREDIT_LIMIT ,rank() over(order by CREDIT_LIMIT desc) CreditRank from sdl.aven_organization order by CreditRank;

-- Row_NUmber()
-- select Org_id,CREDIT_LIMIT ,row_number() over(order by CREDIT_LIMIT desc) CreditRank from sdl.aven_organization order by CreditRank;

-- DENSE_RANK() 
-- select Org_id,CREDIT_LIMIT ,dense_rank() over(order by CREDIT_LIMIT desc) CreditRank from sdl.aven_organization order by CreditRank;

-- NTILE can specify required how many group of result, and it will rank accordingl
 -- select Org_id,CREDIT_LIMIT ,ntile(4) over(order by CREDIT_LIMIT desc) CreditRank from sdl.aven_organization order by CreditRank;
 
 -- split
-- SELECT INDEX_NAME,
-- SUBSTRING(INDEX_NAME, 1, LOCATE('_', INDEX_NAME) - 1) as FirstIndex,
-- SUBSTRING(INDEX_NAME, LOCATE('_', INDEX_NAME) + 1, LENGTH(INDEX_NAME)) as LastIndex
-- FROM sdl.aven_organization;

-- REGULAR EXPRESSSION 
SELECT HOME_AVM_SOURCE
FROM sdl.aven_organization
WHERE HOME_AVM_SOURCE REGEXP 'a|t';





update sdl.aven_organization set stPhone='12345667' where stPhone is null;


