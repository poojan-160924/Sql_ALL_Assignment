/* 1.
Install MySQL Community Server or SQLite on your system 
and verify the installation by connecting to the database
 using the command line or a GUI tool like MySQL Workbench or DB Browser for SQLite.*/
 
 
CREATE DATABASE example;
use  example;

drop database example;
  
  /* Create a new database named 'foodie_app' to simulate a Zomato-style backend.
 */
 
 create database foodie_app;
 
/* Write a CREATE TABLE statement to define a 'restaurants' table in the 'foodie_app' 
database with the following columns: id (integer, primary key),
 name (varchar/character, max 100), cuisine (varchar/character, max 50),
 rating (decimal, e.g., 4.5), and location (varchar/character, max 100).  */
 
use foodie_app;

create table restaurants(
id int primary key,
name varchar(100),
cuisine varchar(100),
rating decimal ,
location varchar(100)
);

/* 4.
Design and create a 'users' table for a Flipkart-style app with columns: user_id (primary key), username, 
email, phone_number, and created_at (date/time). Pick appropriate data types for each column.
<br><br><em><strong>Hint:</strong> Think about which columns should be unique and which data types best fit email and phone numbers.</em> */


create table flipkart_style_app(
user_id int primary key,
user_name varchar(100),
email varchar(100),
phone_numbers int ,
created_at datetime
);

/* 5.
Intentionally make a mistake in your CREATE TABLE statement (such as missing a comma or using an unsupported data type),
 run it, and then fix the error based on the message you receive.<br><br><em><strong>Hint:</strong> Take a screenshot of
 the error and the corrected SQL statement for your records.</em> */
 
 
create table student_data(
student_id int primary key,
student_name varchar(100)         -- incorrect syntax of sql query  i did not saparate the columns with coma that s why it's giving an error
phone_numbers int ,
created_at datetime
);
 

create table student_data(
student_id int primary key,
student_name varchar(100),                -- corrected query of table creation
phone_numbers int ,
created_at datetime
);
 
 
 
 
 
 
 
 





















  