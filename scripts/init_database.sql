/*
===========================================================================================

                              CREATE DATABASE AND SCHEMAS

============================================================================================

Scripts Purpose:
  This scripts creates a new database named 'DataWarehouse' after checking if already exists.
  If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas
  within the database: 'bronze', 'silver', and 'gold'.

WARNING:

  Running this scripts will drop the entire 'DataWarehouse' database if exists.
  All data in the database will be permanently deleted.proceed with caution and emsure you have proper backups before running this scripts.

*/
--  Create Database 'DataWarehouse'
USE master;

go

--Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1
           FROM   sys.databases
           WHERE  NAME = 'DataWarehouse')
  BEGIN
      ALTER DATABASE datawarehouse

      SET single_user WITH

      ROLLBACK immidiate;

      DROP DATABASE datawarehouse;
  END;

go

--Create the 'DataWarehouse' database
CREATE DATABASE datawarehouse;

go

USE datawarehouse;

go

--CREATE FIRST SCHEMA---
CREATE SCHEMA bronze;

go

CREATE SCHEMA silver;

go

CREATE SCHEMA gold;

go 
