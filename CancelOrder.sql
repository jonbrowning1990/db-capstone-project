USE littlelemondb;
CREATE TABLE Cancelations (OrderID INT, Confirmation VARCHAR(255));
DELIMITER //
CREATE PROCEDURE CancelOrder(Ordernum INT)
BEGIN
DELETE FROM Orders WHERE OrderID = Ordernum;
INSERT INTO Cancelations (OrderID, Confirmation) VALUES (Ordernum, CONCAT('Order ', Ordernum, ' is cancelled'));
SELECT Confirmation FROM Cancelations WHERE OrderID = Ordernum;
END //
DELIMITER ;
CALL CancelOrder(2);