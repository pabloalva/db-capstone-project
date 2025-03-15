CREATE DEFINER=`admin1`@`%` FUNCTION `Check_Booking`(New_BookingDate datetime, New_TableNumber int) RETURNS int
    DETERMINISTIC
BEGIN
if exists (select TableNumber, BookingDate from bookings 
where BookingDate = New_BookingDate and TableNumber = New_TableNumber)
then
RETURN 0;
else
return 1;
end if;
END