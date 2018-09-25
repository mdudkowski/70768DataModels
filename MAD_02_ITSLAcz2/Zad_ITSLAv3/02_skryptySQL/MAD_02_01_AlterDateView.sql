USE [ContosoRetailDW];
GO

ALTER VIEW [olap].[vDimDate]
AS
    SELECT
        [Datekey]
    ,   [FullDateLabel]
    ,   [DateDescription]
    ,   [CalendarYearLabel]
    ,   [CalendarYear]
    ,   [CalendarHalfYearLabel]
    ,   [CalendarHalfYear]
    ,   [CalendarQuarterLabel]
    ,   [CalendarQuarter]
    ,   [CalendarMonthLabel]
    ,   [CalendarMonth]
    ,   [IsWorkDay]
    FROM
        [dbo].[DimDate]
	WHERE [CalendarQuarter] = '20051'
GO


