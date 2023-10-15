SELECT customer_id, customer_name
FROM ordert NATURAL JOIN customer 
GROUP BY customer_id, customer_name
HAVING COUNT(*) = (SELECT MAX(cou)
FROM (SELECT COUNT(*) as cou
    FROM ordert
    GROUP BY customer_id));