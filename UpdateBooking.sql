DELIMITER //
CREATE PROCEDURE UpdateBooking(book_id INT, book_date DATE)
BEGIN
DECLARE Confirmation VARCHAR(255);
UPDATE Bookings
SET Date = book_date
WHERE BookingID = book_id;
SET Confirmation = CONCAT("Booking ", book_id, " updated");
SELECT Confirmation;
END;
//
DELIMITER ;
CALL UpdateBooking(9,"2022-12-17");
