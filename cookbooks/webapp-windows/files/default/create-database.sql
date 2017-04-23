use master;
go

create database learnchef;
  go
  use learnchef;
  go
  create table customers(
    id uniqueidentifier not null default newid(),
    primary key(id)
  )
