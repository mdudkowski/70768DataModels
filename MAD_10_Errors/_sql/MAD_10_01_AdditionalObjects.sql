USE [master]
GO

--	DB
------------------------------------------------------------------------------------

	DROP DATABASE IF EXISTS ErrorDB
	GO

	CREATE DATABASE ErrorDB
	GO

	USE ErrorDB
	GO

--	Tables
------------------------------------------------------------------------------------

	DROP TABLE IF EXISTS DimTest1
	DROP TABLE IF EXISTS DimTest2
	DROP TABLE IF EXISTS DimTest3

	DROP TABLE IF EXISTS FactTest1
	DROP TABLE IF EXISTS FactTest2
	DROP TABLE IF EXISTS FactTest3

	GO

--	Dimensions
------------------------------------------------------------------------------------

	CREATE TABLE DimTest1
	(
		Dim1Key				INT
	,	Dim1Name			NVARCHAR(100)
	,	Dim1AttributeLevel1	NVARCHAR(100)
	,	Dim1AttributeLevel2	NVARCHAR(100)
	,	Dim1AttributeLevel3	NVARCHAR(100)	
	)

	INSERT INTO [dbo].[DimTest1]
	( 
		[Dim1Key]
	,	[Dim1Name]
	,	[Dim1AttributeLevel1]
	,	[Dim1AttributeLevel2]
	,	[Dim1AttributeLevel3]
	)
	VALUES
		( 1,N'Member1',	N'Wszystkie',N'GrupaA',N'PodgrupaA1')	,
		( 2,N'Member2',	N'Wszystkie',N'GrupaA',N'PodgrupaA1')	,
		( 3,N'Member3',	N'Wszystkie',N'GrupaA',N'PodgrupaA2')	,
		( 4,N'Member4',	N'Wszystkie',N'GrupaB',N'PodgrupaB1')	,
		( 5,N'Member5',	N'Wszystkie',N'GrupaB',N'PodgrupaB1')

	GO

	------------------------------------------------------------------------------------

	CREATE TABLE DimTest2
	(
		Dim2Key				INT
	,	Dim2Name			NVARCHAR(100)
	,	Dim2AttributeLevel1	NVARCHAR(100)
	,	Dim2AttributeLevel2	NVARCHAR(100)
	,	Dim2AttributeLevel3	NVARCHAR(100)	
	)

	INSERT INTO [dbo].[DimTest2]
	( 
		[Dim2Key]
	,	[Dim2Name]
	,	[Dim2AttributeLevel1]
	,	[Dim2AttributeLevel2]
	,	[Dim2AttributeLevel3]
	)
	VALUES
		( 1,N'Member1',	N'Wszystkie',N'GrupaA',N'PodgrupaA1')	,	--	Duble na Kluczu
		( 1,N'Member2',	N'Wszystkie',N'GrupaA',N'PodgrupaA1')	,	--	Duble na Kluczu
		( 3,N'Member3',	N'Wszystkie',N'GrupaA',N'PodgrupaA2')	,
		( 4,N'Member4',	N'Wszystkie',N'GrupaB',N'PodgrupaB1')	,
		( 5,N'Member5',	N'Wszystkie',N'GrupaB',N'PodgrupaB1')

	GO

	------------------------------------------------------------------------------------

	CREATE TABLE DimTest3
	(
		Dim3Key				INT
	,	Dim3Name			NVARCHAR(100)
	,	Dim3AttributeLevel1	NVARCHAR(100)
	,	Dim3AttributeLevel2	NVARCHAR(100)
	,	Dim3AttributeLevel3	NVARCHAR(100)	
	)

	INSERT INTO [dbo].[DimTest3]
	( 
		[Dim3Key]
	,	[Dim3Name]
	,	[Dim3AttributeLevel1]
	,	[Dim3AttributeLevel2]
	,	[Dim3AttributeLevel3]
	)
	VALUES
		( 1,N'Member1',	N'Wszystkie',N'GrupaA',N'PodgrupaA1')	,	--	Brak Hierarchii A1 -> A/B
		( 2,N'Member2',	N'Wszystkie',N'GrupaA',N'PodgrupaA1')	,	
		( 3,N'Member3',	N'Wszystkie',N'GrupaA',N'PodgrupaA2')	,
		( 4,N'Member4',	N'Wszystkie',N'GrupaB',N'PodgrupaB1')	,
		( 5,N'Member5',	N'Wszystkie',N'GrupaB',N'PodgrupaA1')		--	Brak Hierarchii A1 -> A/B

	GO

--	Facts
------------------------------------------------------------------------------------

	CREATE TABLE FactTest1
	(
		FactKey		INT
	,	FactValue	NUMERIC(10,2)
	,	Dim1Key		INT
	,	Dim2Key		INT
	,	Dim3Key		INT
	)
	GO

	INSERT INTO [dbo].[FactTest1]
	VALUES
		(1,100.12,1,1,1),
		(2,100.12,2,2,2),
		(3,100.12,3,3,3),
		(4,100.12,4,4,4),
		(5,100.12,5,5,5)

	------------------------------------------------------------------------------------

	CREATE TABLE FactTest2
	(
		FactKey		INT
	,	FactValue	NUMERIC(10,2)
	,	Dim1Key		INT
	,	Dim2Key		INT
	,	Dim3Key		INT
	)
	GO

	INSERT INTO [dbo].[FactTest2]
	VALUES
		(1,100.12,-1,1,1),	--	niepoprawny klucz: brak w wymiarze
		(2,100.12,-2,2,2),	--	niepoprawny klucz: brak w wymiarze
		(3,100.12,3,3,3),
		(4,100.12,4,4,4),
		(5,100.12,5,5,5)

	------------------------------------------------------------------------------------

	CREATE TABLE FactTest3
	(
		FactKey		INT
	,	FactValue	NUMERIC(10,2)
	,	Dim1Key		INT
	,	Dim2Key		INT
	,	Dim3Key		INT
	)
	GO

	INSERT INTO [dbo].[FactTest3]
	VALUES
		(1,100.12,NULL,1,1),	--	niepoprawny klucz: NULL
		(2,100.12,NULL,2,2),	--	niepoprawny klucz: NULL
		(3,100.12,3,3,3),
		(4,100.12,4,4,4),
		(5,100.12,5,5,5)

	------------------------------------------------------------------------------------