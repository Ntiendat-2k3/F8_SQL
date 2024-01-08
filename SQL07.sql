-- Sao chép bảng 
-- Sao chép cấu trúc
CREATE TABLE customers (LIKE users INCLUDING ALL)
-- Sao chép data
INSERT INTO customers SELECT * FROM users

SELECT * FROM customers