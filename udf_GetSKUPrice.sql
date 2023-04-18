SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION udf_GetSKUPrice 
( @ID_SKU INT )

RETURNS DECIMAL(18, 2) AS
BEGIN
	DECLARE @Result      DECIMAL(18, 2)
	      , @SumValue    DECIMAL(18, 2)
	      , @SumQuantity DECIMAL(18,2)

	SELECT @SumValue = SUM([Value])
	  FROM Basket
	 WHERE ID_SKU = @ID_SKU

	SELECT @SumQuantity = SUM(Quantity)
	  FROM Basket
	 WHERE ID_SKU = @ID_SKU

	 SET @Result = @SumValue / @SumQuantity

	RETURN @Result
END
GO
