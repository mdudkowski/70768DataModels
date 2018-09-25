USE [ContosoRetailDW]
GO

	DROP VIEW IF EXISTS [olap].[vFactITSLA]
	DROP VIEW IF EXISTS [olap].[vDimDate]
	DROP VIEW IF EXISTS [olap].[vDimStore]
	DROP VIEW IF EXISTS [olap].[vDimMachine]
	DROP VIEW IF EXISTS [olap].[vDimOutage]
	DROP VIEW IF EXISTS [olap].[vDimEntity]
	DROP VIEW IF EXISTS [olap].[vDimGeography]
	GO

	DROP SCHEMA IF EXISTS [olap]
	GO

---------------------------------------------------------------------

	CREATE SCHEMA [olap]
	GO

---------------------------------------------------------------------

		CREATE VIEW [olap].[vFactITSLA]
		AS
		SELECT 
			[ITSLAkey]
		,	[DateKey]
		,	[StoreKey]
		,	[MachineKey]
		,	[OutageKey]
		,	[OutageStartTime]
		,	[OutageEndTime]
		,	[DownTime]
		FROM [dbo].[FactITSLA]
		GO

		CREATE VIEW [olap].[vDimDate]
		AS	
		SELECT [Datekey]
			,  [FullDateLabel]
			,  [DateDescription]
			,  [CalendarYearLabel]
			,  [CalendarHalfYearLabel]
			,  [CalendarQuarterLabel]
			,  [CalendarMonthLabel]
			,  [IsWorkDay]
		FROM [dbo].[DimDate]
		GO


		CREATE VIEW [olap].[vDimStore]
		AS
		SELECT [StoreKey]
			,  [StoreType]
			,  [StoreName]
			,  [StoreDescription]
			,  [Status]
		FROM [dbo].[DimStore]
		GO

		CREATE VIEW [olap].[vDimMachine]
		AS	
		SELECT [MachineKey]
            ,  [MachineLabel]
            ,  [MachineType]
            ,  [MachineName]
            ,  [MachineDescription]
            ,  [VendorName]
            ,  [MachineOS]
            ,  [MachineSource]
            ,  [MachineHardware]
            ,  [MachineSoftware]
            ,  [Status]
		FROM [dbo].[DimMachine]
		GO

		CREATE VIEW [olap].[vDimOutage]
		AS	
		SELECT [OutageKey]
            ,  [OutageLabel]
            ,  [OutageName]
            ,  [OutageDescription]
            ,  [OutageType]
            ,  [OutageTypeDescription]
            ,  [OutageSubType]
            ,  [OutageSubTypeDescription] 
		FROM [dbo].[DimOutage]
		GO

---------------------------------------------------------------------
		
		SELECT TOP 3 * FROM [olap].[vFactITSLA]
		SELECT TOP 3 * FROM [olap].[vDimDate]
		SELECT TOP 3 * FROM [olap].[vDimStore]
		SELECT TOP 3 * FROM [olap].[vDimMachine]
		SELECT TOP 3 * FROM [olap].[vDimOutage]
		GO

---------------------------------------------------------------------