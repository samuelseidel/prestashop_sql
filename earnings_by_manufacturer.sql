SELECT ps_manufacturer.name, SUM(ps_order_detail.total_price_tax_excl / ps_orders.conversion_rate) AS 'Earnings'
FROM ps_order_detail
LEFT JOIN ps_orders ON ps_order_detail.id_order = ps_orders.id_order
LEFT JOIN ps_product ON ps_product.id_product = ps_order_detail.product_id
LEFT JOIN ps_manufacturer ON ps_manufacturer.id_manufacturer = ps_product.id_manufacturer

/* Pro filtrování podle obchodů: */
/* WHERE ps_order_detail.id_shop = 1 */

/* Pro filtrování podle měsíců: */
/* WHERE ps_orders.date_add BETWEEN CAST('2022-09-01' AS DATE) AND CAST('2022-10-01' AS DATE) */

GROUP BY ps_manufacturer.id_manufacturer
/* Pro správnou funkci nutné doplnit značky ke všem produktům. */

ORDER BY SUM(ps_order_detail.total_price_tax_excl / ps_orders.conversion_rate);
