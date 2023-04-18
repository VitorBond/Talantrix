USE talantrix
GO

CREATE TRIGGER TR_Basket_insert_update 
ON Basket 
FOR INSERT AS
IF @@ROWCOUNT > 1
BEGIN

   DECLARE @ID_SKU_COUNT INT,
		   @ID_SKU INT

   SELECT @ID_SKU_COUNT = COUNT(DISTINCT ID_SKU) 
     FROM inserted;

   SELECT TOP (1) @ID_SKU = ID_SKU
	 FROM inserted

	IF (@ID_SKU = 1)
		UPDATE Basket
		SET DiscountValue = Value * 0.05
		WHERE ID_SKU = @ID_SKU
	
END
ELSE
BEGIN
	 SELECT TOP (1) @ID_SKU = ID_SKU
	   FROM inserted

      UPDATE Basket
		 SET DiscountValue = 0
	   WHERE ID_SKU = @ID_SKU
END
GO


