-- USE sql_store;
-- USE sql_hr;
USE sql_invoicing;

-- SELECT 
	-- last_name,
   --  first_name,
   --  points,
    -- (points + 10) * 100 AS "discount factor"
-- FROM customers;

-- SELECT DISTINCT state
-- FROM customers;

-- SELECT
	-- name,
    -- unit_price,
    -- unit_price * 1.1 AS new_price
-- FROM products;

-- SELECT *
-- FROM customers
-- WHERE points > 3000
-- WHERE state = "VA"
-- WHERE state <> "MA"
-- WHERE birth_date > '1990-01-01';

-- SELECT *
-- FROM orders
-- WHERE order_date >= '2019-01-01';

-- SELECT *
-- FROM customers
-- WHERE birth_date > '1990-01-01' OR (points > 1000 AND state = 'MA')
-- WHERE NOT (birth_date > '1990-01-01' OR points > 1000);

-- SELECT *
-- FROM order_items
-- WHERE order_id = 6 AND (unit_price * quantity) > 30;

-- SELECT *
-- FROM customers
-- WHERE state IN ('FL', 'VA', 'GA');
-- WHERE state NOT IN ('FL', 'VA', 'GA');

-- SELECT *
-- FROM products
-- WHERE quantity_in_stock IN (49, 38, 72);

-- SELECT *
-- FROM customers
-- WHERE points BETWEEN 1000 AND 3000;
-- WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01';

-- SELECT *
-- FROM customers
-- WHERE last_name LIKE 'b%'
-- WHERE last_name LIKE '%b%'
-- WHERE last_name LIKE '%y'
-- WHERE last_name LIKE 'b%y'
-- WHERE last_name LIKE '_____y'
-- WHERE last_name LIKE 'b____y'
-- WHERE address LIKE '%trail%' OR address LIKE '%avenue%'
-- WHERE phone NOT LIKE '%9'

-- SELECT *
-- FROM customers
-- WHERE last_name REGEXP 'field'
-- WHERE last_name REGEXP '^brush'
-- WHERE last_name REGEXP 'field$'
-- WHERE last_name REGEXP 'field|mac|rose'
-- WHERE last_name REGEXP '[gim]e'
-- WHERE last_name REGEXP 'e[lmq]'
-- WHERE last_name REGEXP '[a-h]e'
-- WHERE first_name REGEXP 'elka|ambur'
-- WHERE last_name REGEXP 'ey$|on$'
-- WHERE last_name REGEXP '^my|se'
-- WHERE last_name REGEXP 'b[ru]'

-- SELECT *
-- FROM customers
-- WHERE phone IS NULL
-- WHERE phone IS NOT NULL
-- FROM orders
-- WHERE shipped_date IS NULL OR shipper_id IS NULL

-- SELECT *
-- FROM customers
-- ORDER BY state, first_name DESC

-- SELECT first_name, last_name
-- FROM customers
-- ORDER BY birth_date

-- SELECT *
-- FROM order_items
-- WHERE order_id = 2
-- ORDER BY (quantity * unit_price) DESC

-- SELECT *
-- FROM customers
-- LIMIT 3;
-- LIMIT 6, 3;
-- ORDER BY points DESC
-- LIMIT 3;

-- SELECT order_id, o.customer_id, first_name, last_name
-- FROM orders o
-- JOIN customers c ON o.customer_id = c.customer_id

-- SELECT order_id, oi.product_id, name, quantity, oi.unit_price
-- FROM order_items oi
-- JOIN products p ON oi.product_id = p.product_id

-- SELECT *
-- FROM order_items oi
-- JOIN sql_inventory.products p ON oi.product_id = p.product_id

-- SELECT e.employee_id, e.first_name, m.first_name AS manager
-- FROM employees e
-- JOIN employees m ON e.reports_to = m.employee_id

-- SELECT o.order_id, o.order_date, c.first_name, c.last_name, os.name AS status
-- FROM orders o
-- JOIN customers c ON o.customer_id = c.customer_id
-- JOIN order_statuses os ON o.status = os.order_status_id

-- SELECT p.invoice_id, p.date, p.amount, c.name, pm.name AS payment_method
-- FROM payments p
-- JOIN clients c ON p.client_id = c.client_id
-- JOIN payment_methods pm ON p.payment_method = pm.payment_method_id

-- SELECT *
-- FROM order_items oi
-- JOIN order_item_notes oin ON oi.order_id = oin.order_id AND oi.product_id = oin.product_id

-- SELECT *
-- FROM orders o, customers c
-- WHERE o.customer_id = c.customer_id

-- SELECT c.customer_id, c.first_name, o.order_id, sh.name AS shipper
-- FROM customers c
-- LEFT JOIN orders o ON c.customer_id = o.customer_id
-- LEFT JOIN shippers sh ON o.shipper_id = sh.shipper_id
-- ORDER BY c.customer_id

-- SELECT p.product_id, p.name, oi.quantity
-- FROM products p
-- LEFT JOIN order_items oi ON p.product_id = oi.product_id

-- SELECT o.order_id, o.order_date, c.first_name AS customer, sh.name AS shipper, os.name AS status
-- FROM orders o
-- JOIN customers c ON c.customer_id = o.customer_id
-- LEFT JOIN shippers sh ON o.shipper_id = sh.shipper_id
-- JOIN order_statuses os ON o.status = os.order_status_id

-- SELECT e.employee_id, e.first_name, m.first_name AS manager
-- FROM employees e
-- LEFT JOIN employees m ON e.reports_to = m.employee_id

-- SELECT o.order_id, c.first_name, sh.name AS shipper
-- FROM orders o
-- JOIN customers c USING (customer_id)
-- LEFT JOIN shippers sh USING (shipper_id)

-- SELECT *
-- FROM order_items oi
-- LEFT JOIN order_item_notes oin USING (order_id, product_id)

-- SELECT p.date, c.name AS client, p.amount, pm.name AS payment_method
-- FROM payments p
-- JOIN clients c USING (client_id)
-- JOIN payment_methods pm ON p.payment_method = pm.payment_method_id

-- SELECT o.order_id, c.first_name
-- FROM orders o
-- NATURAL JOIN customers c

-- SELECT c.first_name AS customer, p.name AS product
-- FROM customers c
-- CROSS JOIN products p
-- ORDER BY c.first_name

-- SELECT c.first_name AS customer, p.name AS product
-- FROM customers c, products p
-- ORDER BY c.first_name

-- SELECT sh.name AS shipper, p.name AS product
-- FROM shippers sh, products p
-- ORDER BY sh.name

-- SELECT sh.name AS shipper, p.name AS product
-- FROM shippers sh
-- CROSS JOIN products p
-- ORDER BY sh.name

-- SELECT order_id, order_date, 'Active' AS status
-- FROM orders
-- WHERE order_date >= '2019-01-01'
-- UNION
-- SELECT order_id, order_date, 'Archived' AS status
-- FROM orders
-- WHERE order_date < '2019-01-01';

-- SELECT first_name
-- FROM customers
-- UNION
-- SELECT name
-- FROM shippers

-- SELECT customer_id, first_name, points, 'Bronze' AS type
-- FROM customers
-- WHERE points < 2000
-- UNION
-- SELECT customer_id, first_name, points, 'Silver' AS type
-- FROM customers
-- WHERE points BETWEEN 2000 AND 3000
-- UNION
-- SELECT customer_id, first_name, points, 'Gold' AS type
-- FROM customers
-- WHERE points > 3000
-- ORDER BY first_name

-- INSERT INTO customers
-- VALUES (
	-- DEFAULT, 
    -- 'John', 
    -- 'Smith', 
    -- '1990-01-01', 
    -- NULL,
    -- '123 Address St',
    -- 'Los Angeles',
    -- 'CA',
    -- DEFAULT
-- )

-- INSERT INTO shippers (name)
-- VALUES ('Shipper 1'), ('Shipper 2'), ('Shipper 3')

-- INSERT INTO products
-- VALUES 
	-- (DEFAULT, 'Soap', 34, 4.65),
    -- (DEFAULT, 'Apple', 28, 1.99),
    -- (DEFAULT, 'Milk', 15, 2.59)
    
-- INSERT INTO orders (customer_id, order_date, status)
-- VALUES (1, '2019-01-02', 1);

-- INSERT INTO order_items
-- VALUES 
	-- (LAST_INSERT_ID(), 1, 1, 2.95),
    -- (LAST_INSERT_ID(), 2, 1, 3.95);
	
-- CREATE TABLE orders_archived AS
-- SELECT * FROM orders;

-- INSERT INTO orders_archived
-- SELECT *
-- FROM orders
-- WHERE order_date < '2019-01-01';

-- CREATE TABLE invoices_archived AS
-- SELECT
	-- i.invoice_id,
    -- i.number,
    -- c.name AS client,
    -- i.invoice_total,
    -- i.payment_total,
    -- i.invoice_date,
    -- i.due_date,
    -- i.payment_date
-- FROM invoices i
-- JOIN clients c USING (client_id)
-- WHERE payment_total > 0.00;

-- UPDATE invoices
-- SET payment_total = DEFAULT, payment_date = NULL
-- WHERE invoice_id = 1;

-- UPDATE invoices
-- SET payment_total = invoice_total * 0.5, payment_date = due_date
-- WHERE invoice_id = 3;

-- UPDATE invoices
-- SET payment_total = invoice_total * 0.5, payment_date = due_date
-- WHERE client_id = 3;

-- UPDATE customers
-- SET points = points + 50
-- WHERE birth_date < '1990-01-01';

-- UPDATE invoices
-- SET payment_total = invoice_total * 0.5, payment_date = due_date
-- WHERE client_id = 
	-- (SELECT client_id
	-- FROM clients
	-- WHERE name = 'Myworks');
    
-- UPDATE orders
-- SET comments = 'Gold customer'
-- WHERE customer_id IN 
	-- (SELECT customer_id
    -- FROM customers
    -- WHERE points > 3000);
    
-- DELETE FROM invoices
-- WHERE invoice_id = 5;