drop table bookmarks;
create table bookmarks (
id serial8 primary key,
name varchar(255) not null,
url text,
description text,
genre varchar(255)
);


insert into bookmarks (name) values ('YouTube')