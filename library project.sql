-- library book management system 
create database library;
use library;

-- books information table

create table books_info (
		book_id int primary key,
        name varchar(50) not null,
        author_name varchar(50),
        page_count smallint,
        publish_year date);

-- update books_info author information and make a new table for all author information

alter table books_info drop column author_name;
alter table books_info add column author_id int;

-- making author information table 

create table author_info (
		author_id int primary key,
        name varchar(50),
        age tinyint,
        language varchar(30),
        country varchar(50));
        
create table book_location (
		book_id int,
        floor_no tinyint,
        shelf_no tinyint);