SELECT COUNT(*) as total_orders
FROM ordert
WHERE order_date >= '2020-01-10' AND order_date < '2020-01-16';