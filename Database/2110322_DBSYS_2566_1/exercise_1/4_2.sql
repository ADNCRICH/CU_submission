SELECT C.postal_code, COUNT(C.customer_id) as customer_numbers
FROM customer C
GROUP BY C.postal_code
HAVING COUNT(C.customer_id) > 1
ORDER BY customer_numbers DESC;