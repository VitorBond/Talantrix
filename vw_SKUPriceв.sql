CREATE VIEW vw_SKUPrice AS
SELECT *, dbo.udf_GetSKUPrice([ID identity]) AS Price
  FROM SKU