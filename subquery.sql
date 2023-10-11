USE littlelemondb;
SELECT MenuID FROM Menu WHERE MenuID = ANY(SELECT MenuID FROM Orders WHERE Quantity > 1);