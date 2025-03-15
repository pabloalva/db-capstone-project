CREATE PROCEDURE delete_order (ord int)
begin
delete from orders where OrderID = ord;
end;