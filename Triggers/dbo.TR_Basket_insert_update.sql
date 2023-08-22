CREATE TRIGGER dbo.TR_Basket_insert
ON dbo.Basket
AFTER INSERT
AS
BEGIN
    UPDATE b
    SET DiscountValue = i.Value * 0.05
    FROM dbo.Basket b
    INNER JOIN inserted i ON b.ID_SKU = i.ID_SKU
    INNER JOIN (
        SELECT ID_SKU, COUNT(*) AS Count
        FROM inserted
        GROUP BY ID_SKU
    ) c ON b.ID_SKU = c.ID_SKU
    WHERE c.Count >= 2;
END;