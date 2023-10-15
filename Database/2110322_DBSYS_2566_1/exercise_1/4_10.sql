SELECT product_id, product_description, product_finish
FROM product
WHERE product_finish::text LIKE '%White%';