DROP TABLE IF EXISTS "public"."posts";

DROP TABLE IF EXISTS "public"."users";

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS users_id_seq;

-- Table Definition
CREATE TABLE "public"."users" (
    "id" SERIAL,
    "user_email" text,
    "username" text,
    PRIMARY KEY ("id")
);

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS posts_id_seq;

-- Table Definition
CREATE TABLE "public"."posts" (
    "id" SERIAL,
    "title" text,
    "contents" text,
    "views" int4,
    "user_id" int4,
    PRIMARY KEY ("id"),
    constraint fk_user foreign key(user_id)
    references users(id) 
    on delete cascade 
); --if I delete my user, my posts will be deleted too.

INSERT INTO "public"."users" ("id", "user_email", "username") VALUES
(1, 'anne@gmail.com', 'anne_smith'),
(2, 'john@gmail.com', 'john_brown');

INSERT INTO "public"."posts" ("id","title", "contents", "views", "user_id") VALUES
(1, 'Summer!','Looking forward to the summer', 2, 1),
(2, 'New job', 'Starting a new position as C.E.O', 5, 2);