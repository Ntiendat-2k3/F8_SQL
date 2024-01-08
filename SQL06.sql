SELECT age, email, COUNT(id) AS users_count 
FROM users 
GROUP BY age, email
HAVING COUNT(id) >= 2;

-- where(trước) - group by - having(sau)
-- where, having giống nhau

SELECT name, email, MAX(id) AS max_id
FROM users 
GROUP BY name, email
ORDER BY name DESC
LIMIT 1 OFFSET 1



-- Câu 1: Truy vấn danh sách posts và số lượng comment cho từng post
-- C1:
SELECT posts.*, COUNT(comments.id) AS comment_count
FROM posts 
LEFT JOIN comments 
ON posts.id = comments.post_id 
GROUP BY posts.id;

-- C2:
SELECT *, 
(SELECT count(id) FROM comments WHERE posts.id = comments.post_id) AS comment_count
FROM posts

-- Câu 2: Truy vấn danh sách users chưa comment lần nào
SELECT users.*, comments.content
FROM users
INNER JOIN comments
ON users.id = comments.user_id
WHERE comments.content = '';

SELECT * FROM users WHERE id NOT IN (SELECT user_id FROM comments)

-- Câu 3: Hiển thị danh sách bài viết có bình luận > 1
SELECT posts.*, COUNT(comments.id) AS comment_count
FROM posts 
LEFT JOIN comments 
ON posts.id = comments.post_id 
GROUP BY posts.id
HAVING COUNT(comments.id) > 1;

-- Câu 4: Hiển thị thông tin bài viết có id bình luận lớn nhất (không dùng: LIMIT, OFFSET)
SELECT posts.*, COUNT(comments.id) AS comment_count
FROM posts 
LEFT JOIN comments 
ON posts.id = comments.post_id 
GROUP BY posts.id
-- ORDER BY comment_count DESC 
-- LIMIT 1 
HAVING COUNT(comments.id) = (
	SELECT MAX(comment_max)
	FROM (
		SELECT COUNT(id) AS comment_max
		FROM comments
		GROUP BY post_id
	)
)
FETCH FIRST 1 ROWS ONLY  
// -- Nếu số lượng 2 cái bằng 2 "FETCH FIRST 1 ROWS ONLY" => Lấy 1 cái
