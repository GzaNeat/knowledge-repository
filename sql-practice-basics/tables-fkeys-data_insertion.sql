CREATE TABLE FactSales (
	OrderID integer NOT NULL,
	DateKey varchar (30),
	ChannelKey integer,
	StoreKey integer,
	ProductKey integer,
	PromotionKey numeric,
	SalesQuantity integer,
	ReturnQuantity integer,
	CONSTRAINT FactSales_pkey PRIMARY KEY (OrderID)
);

ALTER TABLE FactSales
ALTER COLUMN DateKey TYPE varchar (30);

SELECT table_name,column_name,udt_name,data_type,character_maximum_length
FROM information_schema.columns
WHERE table_name = 'factsales';

CREATE TABLE DimChannel (
	ChannelKey integer NOT NULL,
	ChannelName varchar (13),
	CONSTRAINT DimChannel_pkey PRIMARY KEY (ChannelKey)
);

CREATE TABLE DimCalendar (
	DateKey varchar (30) NOT NULL,
	CalendarYear integer,
	CalendarHalfYearLabel varchar (7),
	CalendarQuarterLabel varchar (7),
	CalendarMonth integer,
	CalendarMonthLabel varchar (15),
	CalendarWeekLabel text,
	CalendarDayOfWeekLabel varchar (15),
	IsWorkDay varchar (15),
	"Star of Week" varchar (50),
	"End of Week" varchar (50),
	CONSTRAINT DimCalendar_pkey PRIMARY KEY (DateKey)
);

ALTER TABLE DimCalendar
ALTER COLUMN DateKey TYPE varchar (30);

ALTER TABLE DimCalendar
ALTER COLUMN "Star of Week" TYPE varchar (50);

ALTER TABLE DimCalendar
ALTER COLUMN "End of Week" TYPE varchar (50);

CREATE TABLE DimPromotion (
	PromotionKey numeric NOT NULL,
	PromotionLabel numeric,
	PromotionName varchar (50),
	DiscountPercent varchar (15),
	StartDate varchar (50),
	EndDate varchar (50),
	CONSTRAINT DimPromotion_pkey PRIMARY KEY (PromotionKey)
);

ALTER TABLE DimPromotion
ALTER COLUMN StartDate TYPE varchar (50);

ALTER TABLE DimPromotion
ALTER COLUMN EndDate TYPE varchar (50);

ALTER TABLE DimPromotion
ALTER COLUMN DiscountPercent TYPE varchar (15);

CREATE TABLE DimStores (
	StoreKey integer NOT NULL,
	GeographyKey integer,
	StoreType varchar (13),
	StoreName varchar (50),
	EmployeeCount integer,
	SellingAreaSize integer,
	Ciudad varchar (25),
	CONSTRAINT DimStores_pkey PRIMARY KEY (StoreKey)
);

ALTER TABLE DimStores
ALTER COLUMN StoreName TYPE varchar (50);

CREATE TABLE DimProduct (
	ProductKey integer NOT NULL,
	ProductName varchar (170),
	ProductDescription varchar (300),
	ProductSubcategoryKey integer,
	Manufacturer varchar (25),
	BrandName varchar (25),
	ClassID integer,
	ClassName varchar (15),
	ColorID integer,
	ColorName varchar (15),
	"Size" varchar (25),
	Weight varchar (15),
	Unicost varchar (15),
	UnitPrice varchar (15),
	CONSTRAINT DimProduct_pkey PRIMARY KEY (ProductKey)
);

CREATE TABLE DimProductSubcategory (
	ProductSubcategoryKey integer NOT NULL,
	ProductSubcategoryName varchar (40),
	ProductCategoryKey integer,
	CONSTRAINT DimProductSubcategory_pkey PRIMARY KEY (ProductSubcategoryKey)
);

CREATE TABLE DimProductCategory (
	ProductCategoryKey integer,
	ProductCategory varchar (40),
	CONSTRAINT DimProductCategory_pkey PRIMARY KEY (ProductCategoryKey)
);

CREATE TABLE DimGeography (
	GeographyKey integer NOT NULL,
	ContinentName varchar (20),
	RegionCountryName varchar (20),
	CONSTRAINT DimGeography_pkey PRIMARY KEY (GeographyKey)
);

--ProductCategory --> ProductSubCategory
ALTER TABLE DimProductSubcategory
ADD CONSTRAINT fk_ProductCategoryKey FOREIGN KEY (ProductCategoryKey) 
REFERENCES DimProductCategory(ProductCategoryKey);

ALTER TABLE DimProduct
ADD CONSTRAINT fk_ProductSubcategoryKey FOREIGN KEY (ProductSubcategoryKey) 
REFERENCES DimProductSubcategory(ProductSubcategoryKey);

ALTER TABLE FactSales
ADD CONSTRAINT fk_ProductKey FOREIGN KEY (ProductKey)
REFERENCES DimProduct(ProductKey);

ALTER TABLE FactSales
ADD CONSTRAINT fk_PromotionKey FOREIGN KEY (PromotionKey)
REFERENCES DimPromotion(PromotionKey);

ALTER TABLE FactSales
ADD CONSTRAINT fk_StoreKey FOREIGN KEY (StoreKey)
REFERENCES DimStores(StoreKey);

ALTER TABLE FactSales
ADD CONSTRAINT fk_ChannelKey FOREIGN KEY (ChannelKey)
REFERENCES DimChannel(ChannelKey);