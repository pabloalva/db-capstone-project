CREATE DEFINER=`admin1`@`%` PROCEDURE `max_order_quantity`()
BEGIN
	select max(Quantity) from orders;
END