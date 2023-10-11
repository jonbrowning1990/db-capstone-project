DELIMITER //
CREATE PROCEDURE AddBooking(book_id INT, cust_id INT, book_date DATE, table_number INT)
BEGIN
DECLARE Confirmation VARCHAR(255);
INSERT INTO Bookings (BookingID, Date, BookingSlot, TableNo, CustomerID) VALUES(book_id, book_date, "19:00:00", table_number, cust_id);
SET Confirmation = "New Booking added";
SELECT Confirmation;
END;
//
CALL AddBooking(9,3,"2022-12-30",4);