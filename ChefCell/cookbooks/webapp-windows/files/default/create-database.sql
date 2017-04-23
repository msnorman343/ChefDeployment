use master;
go

create database learnchef;
  go
  use learnchef;
  go
  create table customers(
    id uniqueidentifier not null default newid(),
    primary key(id),
    first_name varchar(64),
    last_name varchar(64),
    email VARCHAR(64)
);
GO
-- Add sample customer database
INSERT INTO customers(id, first_name, last_name,email) VALUES(newid), 'Tony', 'Stark', 'iron.man@pluralsight.com');
INSERT INTO customers(id, first_name, last_name,email) VALUES(newid), 'Natasha', 'Romanoff', 'black.widow@pluralsight.com');
INSERT INTO customers(id, first_name, last_name,email) VALUES(newid), 'Steve', 'Rogers', 'captain.america@pluralsight.com');
GO
