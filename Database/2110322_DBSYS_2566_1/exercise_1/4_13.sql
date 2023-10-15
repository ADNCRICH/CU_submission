SELECT SUM(P.standard_price * O.ordered_quantity)
fROM product P, order_line O
WHERE P.product_id = O.product_id and O.order_id = 3;