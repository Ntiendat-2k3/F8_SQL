-- Ràng buộc NOT NULL
DELETE FROM users WHERE email='user5@gmail.com';

INSERT INTO
users(id , name, email, password)
VALUES(5, 'User 5', 'user55@gmail.com', '55555');

INSERT INTO 
users(id, name, email, password)
VALUES(7, 'User 7', 'user7@gmail.com', '77777');

INSERT INTO 
users(id, name, email, password)
VALUES(8, 'User 8', 'user8@gmail.com', '88888');

INSERT INTO 
users(name, email, password)
VALUES('User 9', 'user9@gmail.com', '99999');

INSERT INTO 
users(name, email, password)
VALUES('User 10', 'user10@gmail.com', 'aaaaa');


-------------------------------------------------------------------------------
SELECT * FROM users;