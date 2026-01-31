# Creating and Recreating Database

This directory has 4 SQL files, each one will be described below and you should run in order:

1. [migrations.sql](./migrations.sql): This will create all the enunms and tables to setup database.
2. [seeds.sql](./seeds.sql): This will populate all the tables with data.
3. [queries.sql](./queries.sql): This will have some simple queries that can be performed on the database.

---
### Recreating Database

As soon as you drop the entire database, the file [assignment2-full-recreate.sql](./assignment2-full-recreate.sql) to recreate it completely. Basically this file will run the previous 3 files in the order as described above.