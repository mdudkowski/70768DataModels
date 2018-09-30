USE [ContosoRetailDW]
GO

CREATE VIEW [olap].[vDimProduct]
AS
SELECT	p.[ProductKey]
      ,	p.[ProductLabel]
      ,	p.[ProductName]
      ,	p.[ProductDescription]
      ,	p.[Manufacturer]
      ,	p.[BrandName]
      ,	p.[ClassID]
      ,	p.[ClassName]
      ,	p.[StyleID]
      ,	p.[StyleName]
      ,	p.[ColorID]
      ,	p.[ColorName]

      ,	s.[ProductSubcategoryLabel]
      ,	s.[ProductSubcategoryName]
      ,	s.[ProductSubcategoryDescription]

      ,	c.[ProductCategoryLabel]
      ,	c.[ProductCategoryName]
      ,	c.[ProductCategoryDescription]
FROM	
			[dbo].[DimProduct]				AS p
INNER JOIN	[dbo].[DimProductSubcategory]	AS s	
	ON p.ProductSubcategoryKey = s.ProductSubcategoryKey
INNER JOIN	[dbo].[DimProductCategory]		AS c	
	ON s.ProductCategoryKey = c.ProductCategoryKey