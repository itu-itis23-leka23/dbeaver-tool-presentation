CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name TEXT,
    country TEXT
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name TEXT,
    price NUMERIC(10,2)
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id),
    product_id INT REFERENCES products(id),
    quantity INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO customers (name, country) VALUES
('Alice', 'USA'),
('Bob', 'Germany'),
('Edi', 'Albania'),
('Maria', 'Italy');

INSERT INTO products (name, price) VALUES
('Laptop', 1200.00),
('Phone', 800.00),
('Headphones', 150.00);

INSERT INTO orders (customer_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 3, 2),
(2, 2, 1),
(3, 3, 5),
(4, 1, 1);
