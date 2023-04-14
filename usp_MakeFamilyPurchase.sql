SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE usp_MakeFamilyPurchase  
( @FamilySurName VARCHAR(255) )
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @FamilyID INT

	SELECT @FamilyID = [ID identity] 
	  FROM Family 
	 WHERE SurName LIKE @FamilySurName

    IF @FamilyID IS NULL
		PRINT('Введено не существующее имя семьи!')
	ELSE
		UPDATE Family
			SET BudgetValue = BudgetValue - (SELECT SUM([Value]) FROM Basket WHERE ID_Family = @FamilyID)
		WHERE [ID identity] = @FamilyID
		
END
GO
