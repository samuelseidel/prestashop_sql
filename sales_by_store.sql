USE filamentia_cz_db;
SELECT ps_order_detail.product_id, ps_product_lang.name, SUM(ps_order_detail.total_price_tax_excl / ps_orders.conversion_rate) AS 'total_price_tax_excl_czk', SUM(ps_order_detail.product_quantity) AS 'total_quantity_sold', SUM(ps_orders.total_paid_tax_excl / ps_orders.conversion_rate) AS 'order_total_tax_ecl', SUM(ps_orders.total_paid_tax_excl / ps_orders.conversion_rate)/SUM(ps_order_detail.total_price_tax_excl / ps_orders.conversion_rate) AS 'product_order_ratio', (SUM(ps_order_detail.total_price_tax_excl / ps_orders.conversion_rate) * 1.21 / SUM(ps_order_detail.product_quantity)) as 'average_price'
FROM ps_order_detail
LEFT JOIN ps_orders ON ps_order_detail.id_order = ps_orders.id_order
LEFT JOIN ps_product_lang ON ps_product_lang.id_product = ps_order_detail.product_id AND ps_product_lang.id_shop = 1 AND ps_product_lang.id_lang = 1
/* WHERE ps_order_detail.id_shop = 1 */
WHERE ps_orders.date_add BETWEEN CAST('2022-09-01' AS DATE) AND CAST('2022-10-01' AS DATE)
GROUP BY ps_order_detail.product_id
ORDER BY ps_order_detail.product_id;