DELIMITER //
CREATE PROCEDURE AddValidBooking (IN bDate DATE, IN tNo INT)
START TRANSACTION;
BEGIN
SELECT bDate, tNo
WHERE EXISTS (SELECT * FROM Bookings WHERE Date=bDate AND TableNo=tNo)
  INSERT INTO Bookings (BookingDate, TableNo)
  VALUES (bDate, tNo);
END //
COMMIT;
DELIMITER ;