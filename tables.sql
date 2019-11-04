create table users(
id int auto_increment primary key,
username varchar(255) unique not null,
created_at timestamp default now()
);


create table photos(
id int auto_increment primary key,
image_url varchar(255) not null,
user_id int not null,
created_at timestamp default now(),
foreign key(user_id) references users(id)
);


create table comments(
id integer auto_increment primary key,
comment_text varchar(255) not null,
user_id int not null,
photo_id int not null,
created_at timestamp default now(),
foreign key(user_id) references users(id),
foreign key(photo_id) references photos(id)
);


CREATE TABLE likes (
user_id INTEGER NOT NULL,
photo_id INTEGER NOT NULL,
created_at TIMESTAMP DEFAULT NOW(),
FOREIGN KEY(user_id) REFERENCES users(id),
FOREIGN KEY(photo_id) REFERENCES photos(id),
PRIMARY KEY(user_id, photo_id)
);


CREATE TABLE follows (
follower_id INTEGER NOT NULL,
followee_id INTEGER NOT NULL,
created_at TIMESTAMP DEFAULT NOW(),
FOREIGN KEY(follower_id) REFERENCES users(id),
FOREIGN KEY(followee_id) REFERENCES users(id),
PRIMARY KEY(follower_id, followee_id)
);


CREATE TABLE tags (
id INTEGER AUTO_INCREMENT PRIMARY KEY,
tag_name VARCHAR(255) UNIQUE,
created_at TIMESTAMP DEFAULT NOW()
);



CREATE TABLE photo_tags (
photo_id INTEGER NOT NULL,
tag_id INTEGER NOT NULL,
FOREIGN KEY(photo_id) REFERENCES photos(id),
FOREIGN KEY(tag_id) REFERENCES tags(id),
PRIMARY KEY(photo_id, tag_id)
);