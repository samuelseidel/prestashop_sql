SELECT a.email
FROM ps_customer AS a
LEFT JOIN ps_orders AS b ON b.id_customer = a.id_customer
LEFT JOIN ps_order_detail AS c ON c.id_order = b.id_order
WHERE c.product_name LIKE 'Polymaker%'
AND b.date_add BETWEEN CAST('2022-01-01' AS DATE) AND CAST('2022-10-15' AS DATE)
GROUP BY a.id_customer;
