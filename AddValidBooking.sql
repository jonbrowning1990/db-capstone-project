DELIMITER //
CREATE PROCEDURE AddValidBooking(bookingdate DATE, slot TIME, tablenumber INT, Custy INT)
BEGIN
DECLARE bookingstatus VARCHAR(255);
START TRANSACTION;
IF EXISTS((SELECT * FROM Bookings WHERE Date = bookingdate AND TableNo = tablenumber)) THEN
ROLLBACK;
SET bookingstatus = CONCAT("Table ", tablenumber, ' is already booked - booking cancelled');
ELSE
INSERT INTO Bookings (Date, BookingSlot, TableNo, CustomerID) VALUES(bookingdate, slot, tablenumber, Custy);
COMMIT;
SET bookingstatus = CONCAT("Table ", tablenumber, ' is available: booking successful');
END IF;
SELECT bookingstatus AS 'Booking status';
END;
//
DELIMITER ;

CALL AddValidBooking("2022-10-10", "19:00:00", 5, 1);