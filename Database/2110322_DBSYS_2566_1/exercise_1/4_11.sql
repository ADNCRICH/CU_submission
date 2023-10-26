SELECT *
FROM customer
WHERE customer_id NOT IN (
SELECT DISTINCT customer_id
FROM ordert
);