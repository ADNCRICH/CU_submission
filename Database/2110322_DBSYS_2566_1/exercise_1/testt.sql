SELECT customer_id, customer_name, COUNT(*) as order_count
FROM customer NATURAL JOIN ordert
GROUP BY customer_id, customer_name
HAVING COUNT(*) = (
	SELECT MAX(cou)
	FROM (
		SELECT COUNT(*) as cou
		FROM ordert
		GROUP BY customer_id
	)
);