SELECT customer_id, customer_name, COUNT(*) as number_of_order
FROM ordert NATURAL JOIN customer 
GROUP BY customer_id, customer_name
ORDER BY number_of_order DESC;