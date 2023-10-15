SELECT customer_id, customer_name
FROM customer
WHERE customer_id = ANY(
SELECT DISTINCT customer_id
FROM ordert
WHERE order_date >= '2020-01-10' AND order_date < '2020-01-16'
);