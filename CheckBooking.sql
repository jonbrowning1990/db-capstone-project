DELIMITER //
CREATE PROCEDURE CheckBooking(bookingdate DATE, tablenumber INT)
BEGIN
DECLARE bookingstatus VARCHAR(255);
IF EXISTS((SELECT * FROM Bookings WHERE Date = bookingdate AND TableNo = tablenumber)) THEN
SET bookingstatus = CONCAT("Table ", tablenumber, ' is booked');
ELSE
SET bookingstatus = CONCAT("Table ", tablenumber, ' is available');
END IF;
SELECT bookingstatus AS 'Booking status';
END;
//

DELIMITER ;