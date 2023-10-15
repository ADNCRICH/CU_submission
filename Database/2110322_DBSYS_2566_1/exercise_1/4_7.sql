SELECT product_id, product_description
FROM product
WHERE product_id = ANY(
	SELECT product_id
FROM order_line
GROUP BY product_id
HAVING SUM(ordered_quantity) = (SELECT MAX(sum)
FROM (SELECT SUM(ordered_quantity)
    FROM order_line
    GROUP BY product_id))
);