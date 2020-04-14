-- BASE MODE

--Get all customers and their addresses.
SELECT * FROM "customers"
JOIN "addresses" ON "customers"."id" = "addresses"."customer_id";
--Get all orders and their line items (orders, quantity and product).
SELECT * FROM "orders"
JOIN "line_items" ON "orders"."id" = "line_items"."order_id";
--Which warehouses have cheetos?
SELECT "description", "warehouse" FROM "products"
JOIN "warehouse_product" ON "products"."id" = "warehouse_product"."product_id"
JOIN "warehouse" ON "warehouse_product"."warehouse_id" = "warehouse"."id"
WHERE "description" = 'cheetos';
--Which warehouses have diet pepsi?
SELECT "description", "warehouse" FROM "products"
JOIN "warehouse_product" ON "products"."id" = "warehouse_product"."product_id"
JOIN "warehouse" ON "warehouse_product"."warehouse_id" = "warehouse"."id"
WHERE "description" = 'diet pepsi';
--Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "customers"."first_name", COUNT("orders"."id") FROM "orders"
JOIN "addresses" ON "orders"."address_id" = "addresses"."id"
JOIN "customers" ON "addresses"."customer_id" = "customers"."id"
GROUP BY "customers"."first_name";
--How many customers do we have?
SELECT COUNT("id") FROM "customers";
--How many products do we carry?
SELECT COUNT("id") FROM "products";
--What is the total available on-hand quantity of diet pepsi?
SELECT COUNT("line_items"."quantity") FROM "products"
JOIN "line_items" ON "products"."id" = "line_items"."product_id"
WHERE "description" = 'diet pepsi';