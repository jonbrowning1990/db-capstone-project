USE littlelemondb;
SELECT Customers.CustomerID, CONCAT(Customers.FirstName, ' ', Customers.LastName) AS FullName, Orders.OrderID, Orders.Cost, Menu.MenuName,
MenuItems.CourseName FROM
Customers INNER JOIN Orders ON Customers.CustomerID = Orders.OrderID
INNER JOIN Menu ON Orders.MenuID = Menu.MenuID
INNER JOIN MenuItems ON Menu.MenuItemsID = MenuItems.MenuItemsID
ORDER BY Orders.Cost ASC;