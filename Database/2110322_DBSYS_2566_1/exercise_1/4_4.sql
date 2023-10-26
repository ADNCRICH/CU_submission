SELECT P.product_id, P.product_description
FROM order_line O LEFT JOIN product P
    ON O.product_id = P.product_id
GROUP BY P.product_id
HAVING COUNT(O.order_id) = (SELECT MAX(cou)
FROM(SELECT COUNT(*) as cou
    FROM order_line
    GROUP BY product_id));