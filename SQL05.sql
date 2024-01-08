-- ORDER BY: Sắp xếp các bản ghi theo thứ tự tăng dần, giảm dần theo 1 trường nào đó
-- ASC là mặc đinh
-- SELECT * FROM users ORDER BY name DESC, id DESC;

-- Yêu cầu: Tạo table course để lưu trữ các khóa học: id , name, price, created_at, update_at
-- Thiết lập quan hệ vs table users theo quan hệ nhiều - nhiều
-- Truy vấn trả về danh sách khóa học mà user có id = 1 đã mua 
-- Thông tin trả về: username, email, thông tin khóa học 
-- Sắp xếp kết quả theo giá giảm dần
-- Tạo thêm 1 cột ở câu lệnh truy vấn có tên là 'discount'
-- Giá trị ở cột discount theo điều kiện sau: 
-- Nếu giá trị khóa học từ 500.000 trở lên --> 10%, ngược lại là 0
-- Tạo thêm cột "sale_price" thể hiện giá cần thanh toán (sau khi đã trừ discount)
-- LIMIT: Hiển thị khóa học có giá cao nhất, cao thứ 2

SELECT courses.*, users.name AS username, users.email,
CASE 
	WHEN courses.price > 600000 THEN 10
	ELSE '0'
END AS discount, (courses.price - courses.price * CASE  ) as sale_courses
FROM users_courses
INNER JOIN users
ON users_courses.users_id = users.id
INNER JOIN courses
ON users_courses.courses_id = courses.id
WHERE users.id = 1
ORDER BY courses.price DESC
LIMIT 1 OFFSET 1;
-- OFFSET: loại bỏ bao nhiêu bản ghi đầu tiên 
