CREATE PROCEDURE dbo.usp_MakeFamilyPurchase(@FamilySurName VARCHAR(255))
AS
BEGIN
    DECLARE @FamilyID INT;
    SELECT @FamilyID = ID
    FROM dbo.Family
    WHERE SurName = @FamilySurName;

    IF @FamilyID IS NULL
        RAISEERROR('Family not found', 16, 1);

    DECLARE @TotalPurchase DECIMAL(18, 2);
    SELECT @TotalPurchase = SUM(Value)
    FROM dbo.Basket
    WHERE ID_Family = @FamilyID;

    UPDATE dbo.Family
    SET BudgetValue = BudgetValue - @TotalPurchase
    WHERE ID = @FamilyID;
END;
