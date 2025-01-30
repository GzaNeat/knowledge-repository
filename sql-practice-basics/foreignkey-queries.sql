CREATE TABLE Album (
	AlbumId int NOT NULL,
	Title varchar (160),
	ArtistId int,
	CONSTRAINT Album_pkey PRIMARY KEY (AlbumId)
);

CREATE TABLE Artist (
	ArtistId int NOT NULL,
	Name varchar (120),
	CONSTRAINT Artist_pkey PRIMARY KEY (ArtistId)
);

CREATE TABLE Customer (
	CustomerId int NOT NULL,
	FirstName varchar (40),
	LastName varchar (20),
	Company varchar (80),
	Address varchar (70),
	City varchar (40),
	"State" varchar (40),
	Country varchar (40),
	PostalCode varchar (10),
	Phone varchar (24),
	Fax varchar (24),
	Email varchar (60),
	SupportRepId int,
	CONSTRAINT Customer_pkey PRIMARY KEY (CustomerId)
);

CREATE TABLE Employee (
	EmployeeId int NOT NULL,
	LastName varchar (20),
	FirstName varchar (20),
	Title varchar (30),
	ReportsTo varchar (137),
	BirthDate varchar (137),
	HireDate varchar (137),
	Address varchar (70),
	City varchar (40),
	"State" varchar (40),
	Country varchar (40),
	PostalCode varchar (10),
	Phone varchar (24),
	Fax varchar (24),
	Email varchar (60),
	CONSTRAINT EmployeeId_pkey PRIMARY KEY (EmployeeId)
);

CREATE TABLE Genre (
	GenreId int NOT NULL,
	"Name" varchar (120),
	CONSTRAINT Genre_pkey PRIMARY KEY (GenreId)
);

CREATE TABLE Invoice (
	InvoiceId int NOT NULL,
	CustomerId int,
	InvoiceDate varchar (137),
	BillingAddress varchar (70),
	BillingCity varchar (40),
	BillingState varchar (40),
	BillingCountry varchar (40),
	BillingPostalCode varchar (10),
	Total numeric(10,2) NOT NULL,
	CONSTRAINT Invoice_pkey PRIMARY KEY (InvoiceId)
);

CREATE TABLE InvoiceLine (
	InvoiceLineId int NOT NULL,
	InvoiceId int,
	TrackId int,
	UnitPrice numeric (10,2) NOT NULL,
	Quantity varchar (137),
	CONSTRAINT InvoiceLine_pkey PRIMARY KEY (InvoiceLineId)
);

CREATE TABLE MediaType (
	MediaTypeId int NOT NULL,
	"Name" varchar (120),
	CONSTRAINT MediaType_pkey PRIMARY KEY (MediaTypeId)
);

CREATE TABLE Playlist (
	PlaylistId int NOT NULL,
	"Name" varchar (120),
	CONSTRAINT Playlist_pkey PRIMARY KEY (PlaylistId)
);

CREATE TABLE PlaylistTrack (
	PlaylistId int NOT NULL,
	TrackId int,
	CONSTRAINT PlaylistTrack_pkey PRIMARY KEY (PlaylistId)
);

CREATE TABLE Track (
	TrackId int NOT NULL,
	"Name" varchar (200) NOT NULL,
	AlbumId int,
	MediaTypeId int,
	GenreId int,
	Composer varchar (200),
	Milliseconds varchar (137),
	Bytes varchar (137),
	UnitPrice numeric(10,2) NOT NULL,
	CONSTRAINT Track_pkey PRIMARY KEY (TrackId)
);

ALTER TABLE Album
ADD CONSTRAINT fk_ArtistId FOREIGN KEY (ArtistId) 
REFERENCES Artist(ArtistId);

ALTER TABLE Invoice
ADD CONSTRAINT fk_CustomerId FOREIGN KEY (CustomerId) 
REFERENCES Customer(CustomerId);

ALTER TABLE InvoiceLine
ADD CONSTRAINT fk_InvoiceId FOREIGN KEY (InvoiceId) 
REFERENCES Invoice(InvoiceId);

ALTER TABLE InvoiceLine
ADD CONSTRAINT fk_TrackId FOREIGN KEY (TrackId) 
REFERENCES Track(TrackId);

ALTER TABLE PlaylistTrack
ADD CONSTRAINT fk_TrackId FOREIGN KEY (TrackId) 
REFERENCES Track(TrackId);

ALTER TABLE Track
ADD CONSTRAINT fk_AlbumId FOREIGN KEY (AlbumId) 
REFERENCES Album(AlbumId);

ALTER TABLE Track
ADD CONSTRAINT fk_MediaTypeId FOREIGN KEY (MediaTypeId) 
REFERENCES MediaType(MediaTypeId);

ALTER TABLE Track
ADD CONSTRAINT fk_GenreId FOREIGN KEY (GenreId) 
REFERENCES Genre(GenreId);