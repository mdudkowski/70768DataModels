USE [ContosoRetailDW]
GO

--	Tabela Faktów
---------------------------------------------------------------------
	
	--	SLA: Service Level Agreement, SLA (pol. umowa o gwarantowanym poziomie świadczenia usług)
	--	Outage: przestój

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

--	Tabele Wymiarów
---------------------------------------------------------------------
	
	--	Wymiar DimDate
	---------------------------------------------------------------------
	
		SELECT [Datekey]
			,  [FullDateLabel]
			,  [DateDescription]
			,  [CalendarYearLabel]
			,  [CalendarHalfYearLabel]
			,  [CalendarQuarterLabel]
			,  [CalendarMonthLabel]
			,  [IsWorkDay]
		FROM [dbo].[DimDate]

	--	Wymiar DimStore
	---------------------------------------------------------------------

		SELECT [StoreKey]
			,  [StoreType]
			,  [StoreName]
			,  [StoreDescription]
			,  [Status]
		FROM [dbo].[DimStore]

	--	Wymiar DimMachine
	---------------------------------------------------------------------
	
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

	--	Wymiar DimOutage
	---------------------------------------------------------------------
	
		SELECT [OutageKey]
            ,  [OutageLabel]
            ,  [OutageName]
            ,  [OutageDescription]
            ,  [OutageType]
            ,  [OutageTypeDescription]
            ,  [OutageSubType]
            ,  [OutageSubTypeDescription] 
		FROM [dbo].[DimOutage]
