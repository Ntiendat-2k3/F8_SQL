-- Comment SQL
-- 1. Thêm dữ liệu mới (C)
INSERT INTO 
users(id, name, email, password, status, created_at, update_at)
VALUES(1, 'User 1', 'user@gmail.com', '123456', true, NOW(), NOW());

INSERT INTO 
users(id, name, email, password, status, created_at, update_at)
VALUES(2, 'User 2', 'user2@gmail.com', '1234567', true, NOW(), NOW());

INSERT INTO 
users(id, name, email, password, status, created_at, update_at)
VALUES(3, 'User 3', 'user3@gmail.com', '12345678', true, NOW(), NOW());


-- 2. Sửa dữ liệu (R)
UPDATE users SET name='User 11', email='user11@gmail.com', status=false, update_at=NOW()
WHERE id=1;
-- WHERE là điều kiện 


-- 3. Xóa dữ liệu (U)
DELETE FROM users WHERE id=1;


-- 4. Hiển thị dữ liệu (D)
-- <>: khác
-- SELECT * FROM users WHERE id<>2 AND id<=3;
SELECT * FROM users WHERE id between 1 AND 2;
-- 1<= id <= 2
SELECT * FROM users WHERE LOWER(email) LIKE '%user 3%' OR LOWER(name) LIKE '%user 3%';
-- chuyển name về lower phải ghi thường 


-----------------------------------------------------------------------------
UPDATE users SET update_at=NULL WHERE id=3;
SELECT * FROM users WHERE update_at IS NOT NULL;

SELECT id, name AS fullname, email, password FROM users WHERE update_at IS NOT NULL;




