TRUNCATE users, posts RESTART IDENTITY;

INSERT INTO "public"."users" ("user_email", "username") VALUES
('anne@gmail.com', 'anne_smith'),
('john@gmail.com', 'john_brown');

INSERT INTO "public"."posts" ("title", "contents", "views", "user_id") VALUES
('Summer!','Looking forward to the summer', 2, 1),
('New job', 'Starting a new position as C.E.O', 5, 2);