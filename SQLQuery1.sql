CREATE DATABASE TurboApp ;

use TurboApp;





CREATE TABLE Markas(
	Id INT Identity(1,1) PRIMARY KEY,
	[Name] Varchar(200) NOT NULL,
)

CREATE TABLE Models(
	Id INT Identity(1,1) PRIMARY KEY,
	[Name] Varchar(200) NOT NULL,
	MarkaId INT NOT NULL,
	Constraint FK_Models_MarkaId FOREIGN Key(MarkaId) REFERENCES Markas(Id)
)

CREATE TABLE Categories(
	Id INT Identity(1,1) PRIMARY KEY,
	[Name] nvarchar(200) NOT NULL,
)

CREATE TABLE Colors(
Id INT Identity(1,1) PRIMARY KEY,
[Name] nvarchar(200) NOT NULL,
)

CREATE TABLE FuelTypes(
Id INT Identity(1,1) PRIMARY KEY,
[Name] nvarchar(200) NOT NULL,
)

CREATE TABLE Gears(
Id int Identity (1,1) PRIMARY KEY,
[Name] nvarchar(20) NOT NULL,
)

CREATE TABLE Transmissions(
[Id] int Identity (1,1) PRIMARY KEY,
[Name] nvarchar (25) NOT NULL,
)

CREATE TABLE Markets(
[Id] Int Identity (1,1) PRIMARY KEY,
[Name] nvarchar (20) NOT NULL,
)

CREATE TABLE Equipments(
[Id] int Identity (1,1) PRIMARY KEY,
[Name] nvarchar (20) NOT NULL,
)

create table Advertisements(
Id int identity(1,1) Primary key,
Mileage decimal(18,1) not null,
MileageUnit tinyint not null,
Price int not null,
Currency tinyint not null,
IsCrashed bit not null,
IsPainted bit not null,
ForSpareParts bit not null,
SeatsCount tinyint ,
HasLoan bit not null,
HasBarter bit not null,
Vin nvarchar(100) not null,
[Description] nvarchar (200) not null,
[Year] int not null,
EngineVolume int not null,
EnginePower int not null,
ModelId int not null,
CategoryId int not null,
ColorId int not null,
FuelTypeId int not null,
GearId int not null,
TransmissionId int not null,
Constraint FK_Advertisement_ModelId foreign key (ModelId)
references Models(Id),
Constraint FK_Advertisement_FueltypeId foreign key (FueltypeId)
references Fueltypes(Id),
Constraint FK_Advertisement_TransmissionsId foreign key (TransmissionId)
references Transmissions(Id),
Constraint FK_Advertisement_GearId foreign key (GearId)
references Gears(Id),
Constraint FK_Advertisement_ColorId foreign key (ColorId)
references Colors(Id),
Constraint FK_Advertisement_CategoryId foreign key (CategoryId)
references Categories(Id),
Constraint Ck_advertisement_Price Check (Price >0),
Constraint Ck_advertisement_Year Check ([Year] >1970 and [Year] <= year(getdate())),
)

create table AdvertisementEquipments (
AdvertisementId int not null,
EquipmentId int not null,
Constraint PK_AdvertisementEquipments Primary key (AdvertisementId,EquipmentId)
)

create table Images (
Id int Primary key identity(1,1),
[Name] nvarchar(200) not null,
ViewPoint tinyint,
AdvertisementId int not null
Constraint FK_Images_AdvertisementId foreign key (AdvertisementId)
references Advertisements(Id)
)
alter table AdvertisementEquipments
add Constraint FK_AdvertisementEquipments foreign key (AdvertisementId)
references Advertisements(Id),
constraint Fk_AdvertisementEquipment foreign key (EquipmentId) references Equipments (Id)






insert into [dbo].[FuelTypes](Name)
SELECT N'Benzin'
UNION SELECT N'Dizel'
UNION SELECT N'Qaz'
UNION SELECT N'Elektro'
UNION SELECT N'Hibrid'
UNION SELECT N'Plug-in Hibrid'

insert into [dbo].[Transmissions]
SELECT N'Mexaniki'
UNION SELECT N'Avtomat'
UNION SELECT N'Robotlaşdırılmış'
UNION SELECT N'Variator'

insert into [dbo].[Categories]

SELECT N'Avtobus'
UNION SELECT N'Dartqı'
UNION SELECT N'Furqon'
UNION SELECT N'Hetçbek'
UNION SELECT N'Kabriolet'
UNION SELECT N'Karvan'
UNION SELECT N'Kupe'
UNION SELECT N'Kvadrosikl'
UNION SELECT N'Liftbek'
UNION SELECT N'Mikroavtobus'
UNION SELECT N'Minivan'
UNION SELECT N'Moped'
UNION SELECT N'Motosiklet'
UNION SELECT N'Offroader / SUV'
UNION SELECT N'Pikap'
UNION SELECT N' Qolfkar'
UNION SELECT N'Rodster'
UNION SELECT N'Sedan'
UNION SELECT N'Universal'
UNION SELECT N'Van'
UNION SELECT N'Yük maşını'


delete from [dbo].[Equipments]
dbcc checkident('[dbo].[Equipments]',RESEED,0)

insert into [dbo].[Equipments]([Name])

SELECT N'Yüngül lehimli disklər'
UNION SELECT N'ABS'
UNION SELECT N'Lyuk'
UNION SELECT N'Yağış sensoru'
UNION SELECT N'Mərkəzi qapanma'
UNION SELECT N'Park radarı'
UNION SELECT N'Kondisioner'
UNION SELECT N'Oturacaqların isidilməsi'
UNION SELECT N'Dəri salon'
UNION SELECT N'Ksenon lampalar'
UNION SELECT N'Arxa görüntü kamerası'
UNION SELECT N'Yan pərdələr'
UNION SELECT N'Oturacaqların ventilyasiyası'

delete from [dbo].[Colors]
dbcc checkident('[dbo].[Colors]',RESEED,0)

insert into [dbo].[Colors]([Name])
SELECT N'Qara'
UNION SELECT N'Yaş Asfalt'
UNION SELECT N'Boz'
UNION SELECT N'Gümüşü'
UNION SELECT N'Ağ'
UNION SELECT N'Bej'
UNION SELECT N'Tünd qırmızı'
UNION SELECT N'Qırmızı'
UNION SELECT N'Çəhrayı'
UNION SELECT N'Narıncı'
UNION SELECT N'Qızılı'
UNION SELECT N'Sarı'
UNION SELECT N'Yaşıl'
UNION SELECT N'Mavi'
UNION SELECT N'Göy'
UNION SELECT N'Bənövşəyi'
UNION SELECT N'Qəhvəyi'