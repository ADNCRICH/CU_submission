DELETE FROM order_line WHERE order_id = ANY(SELECT order_id
FROM ordert
WHERE customer_id = 10001);
DELETE FROM ordert WHERE customer_id = 10001;
DELETE FROM customer WHERE customer_id = 10001;

SELECT *
FROM customer;

SELECT *
FROM ordert;

SELECT *
FROM order_line;