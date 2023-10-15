SELECT C.postal_code, COUNT(C.customer_id) as customer_numbers
FROM customer C
GROUP BY C.postal_code
ORDER BY customer_numbers DESC;