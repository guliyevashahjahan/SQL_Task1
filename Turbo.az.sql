use master
go
create database TurboAz
use TurboAz


create table [Markas](
Id int primary key identity(1,1),
[Name] varchar(70) unique not null)

create table Models (
Id int primary key identity(1,1),
MarkaId int not null,
[Name] varchar(70) unique not null,
constraint FK_Models_MarkaId foreign key (MarkaId)
references markas(Id))

create table Categories (
Id int primary key identity(1,1),
[Name] nvarchar(70) unique not null)

create table Fueltypes (
Id int primary key identity(1,1),
[Name] nvarchar(70) unique not null)
 
create table Transmissions (
Id int primary key identity(1,1),
[Name] nvarchar(70) unique not null)

create table Gears (
Id int primary key identity(1,1),
[Name] nvarchar(70) unique not null)

create table Markets (
Id int primary key identity (1,1),
[Name] nvarchar(70) not null)

create table Colors (
Id int primary key identity(1,1),
[Name] nvarchar(70) unique not null)

create table Advertisement (
[Id] int identity(1,1),
[MarkaId] int not null,
[ModelId] int not null,
[CategoryId] int not null,
[ColorId] int not null,
[FuelTypeId] int not null,
TransmissionId int not null,
GearId int not null,
MarketId int not null,
CreatedAt datetime not null,
Price int not null,
CONSTRAINT PK_Advertisement_Id PRIMARY KEY ([Id]),
constraint Price Check ([Price] >0),
constraint DF_Advertisement_CreatedAt default dateadd(HOUR,4,getutcdate()) for CreatedAt,
CONSTRAINT FK_Advertisement_MarkaId FOREIGN KEY (MarkaId)
  REFERENCES [dbo].Markas([Id]),
  CONSTRAINT FK_Advertisement_ModelId FOREIGN KEY (ModelId)
  REFERENCES [dbo].Models([Id]),
  CONSTRAINT FK_Advertisement_CategoryId FOREIGN KEY (ModelId)
  REFERENCES [dbo].Categories([Id]),
  CONSTRAINT FK_Advertisement_FueltypeId FOREIGN KEY (FueltypeId)
  REFERENCES [dbo].Fueltypes([Id]),
  CONSTRAINT FK_Advertisement_TransmissionId FOREIGN KEY (TransmissionId)
  REFERENCES [dbo].Transmission([Id]),
  CONSTRAINT FK_Advertisement_GearId FOREIGN KEY (GearId)
  REFERENCES [dbo].Gear([Id]),
  CONSTRAINT FK_Advertisement_MarketId FOREIGN KEY (MarketId)
  REFERENCES [dbo].Markets([Id])
)