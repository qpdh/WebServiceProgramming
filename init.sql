# DB 생성
create database if not exists travel_community;

use travel_community;

# 기존에 테이블이 있으면 다 날리기

drop table if exists community_comment;
drop table if exists community;

drop table if exists travel_review;
drop table if exists travel;
drop table if exists users;

# 사용자 테이블
create table if not exists users(
id varchar(20) not null unique,
name varchar(20) not null,
password varchar(20) not null,
primary key(id)
);

# 커뮤니티 테이블
create table if not exists community(
id int not null auto_increment,
date varchar(255) not null,
file_name varchar(255),
user_id varchar(20) not null,
tag varchar(255) not null,
title varchar(50) not null,
comment text not null,
likes int not null,
primary key(id),
foreign key (user_id) references users (id)
);

# 커뮤니티 댓글 테이블
create table if not exists community_comment(
id int not null auto_increment,
date varchar(255) not null,
user_id varchar(20) not null,
comment text not null,
community_id int not null,
primary key(id),
foreign key (user_id) references users (id),
foreign key (community_id) references community (id)
);

# 여행지 테이블
create table if not exists travel(
id int not null auto_increment,
locate varchar(50) not null,
photo1 varchar(50),
photo2 varchar(50),
photo3 varchar(50),
information text not null,
place varchar(45),
primary key (id)
);

# 여행지 리뷰 테이블
create table if not exists travel_review(
id int not null auto_increment,
identity varchar(20) not null,
date date not null,
travel_id int not null,
comment text,
score int,
primary key(id),
foreign key (travel_id) references travel (id)
);

create table if not exists likes_check(
community_id int not null,
user_id varchar(20) not null,
foreign key(community_id) references community(id),
foreign key(user_id) references users(id)
);
