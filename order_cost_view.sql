CREATE VIEW `Order_cost_view` AS select OrderID, TotalCost from orders where TotalCost > 200;