CREATE DEFINER=`admin1`@`%` PROCEDURE `CheckBooking`(New_BookingDate datetime, New_TableNumber int)
BEGIN
declare table_status varchar(255);
if exists (select TableNumber, BookingDate from bookings 
where BookingDate = New_BookingDate and TableNumber = New_TableNumber)
then
set table_status = 'Table not available';
else set table_status = 'Table available';
end if;
select table_status;
END