USE [ContosoRetailDW];
GO

/****** Object:  View [olap].[vDimStore]    Script Date: 2018-04-15 22:27:32 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

ALTER VIEW [olap].[vDimStore]
AS
    SELECT
        [StoreKey]
    ,   [StoreType]
    ,   [StoreName]
    ,   [StoreDescription]
    ,   [Status]
    ,   [GeographyKey]
    ,   [EntityKey]
    FROM
        [dbo].[DimStore];
GO


