USE littlelemondb;
CREATE VIEW OrdersView AS SELECT OrderID, Quantity, Cost
FROM Orders;
SELECT * FROM OrdersView;