SELECT customer_id, customer_name, COUNT(*) as order_count
FROM customer NATURAL JOIN ordert 
GROUP BY customer_id, customer_name
ORDER BY COUNT(*) DESC
LIMIT 3;