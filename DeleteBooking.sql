DELIMITER //
CREATE PROCEDURE DeleteBooking(book_id INT)
BEGIN
DECLARE Confirmation VARCHAR(255);
DELETE FROM Bookings
WHERE BookingID = book_id;
SET Confirmation = CONCAT("Booking ", book_id, " deleted");
SELECT Confirmation;
END;
//
DELIMITER ;
CALL DeleteBooking(9);
