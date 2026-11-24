create database datamites ;

# connecting with the database 
use datamites ;

# Constraints - Rules for column to follow 
# 1. Not null - column cannot have null values init 
# 2. Unique - Column cannot have duplicate values 
# 3. Primary key - combination of not null + unique 
# 4. Foreign key - column which is primary key in another table 
# 5. check - Allows to give condition and it will make sure condition 
          #  is followed when the data is inserted 
# 6. Default - allows to mention a default value 
# 7. Auto_increment - inserts the values int automatically 
	# default starts with 1 - n 
	# if already instered - it will continue from that last data 
	# for e.g if the last data is 100 then next value will be 101 

# Syntax to create table 
# create table table_name (
			#  col_name datatype constraint ,
            #  col_name1 datatype constraint , 
            # col_name2 datatype constraint .... ) ; 

# 1. Create table Students 
create table students ( 
student_id int primary key auto_increment,
student_name varchar(20) not null ,
Age tinyint check(Age between 1 and 50 ) , 
Gender enum("Male" , "Female") , 
City varchar(25) );

# 2. Create table courses 
create table courses ( 
course_id int primary key auto_increment , 
course_name varchar(30) not null ,
fees int ) ; 

# 3. create table Admissions 
create table Admissions ( 
admission_id int primary key auto_increment,
stu_id int , 
course_id int , 
Fees_status set("Paid" , "Pending" , "Partially Paid") ,
Duration int ,
Location varchar(30) ,
foreign key(stu_id) references students(student_id) , 
foreign key(course_id) references courses(course_id) on delete cascade );
# foreign key(child_col_name) references parent_table(col_name) 
## on delete cascade - 
# (when info is deleted from parent this will also delete it from child 
## on delete restrict (by default) - ( won't allow to delete from parent ) 

###################################################

# Insert - DML commands 
# Used to insert the information into the tables 
# syntax - insert into table_name values () , () ,() ,() ....;
# alternative syntax - specific col insertion of data 
# syntax - insert into table_name(col1, col2, col4) 
#           values ( d1 , d2, d4) , () ....;

# students 
insert into students values 
( 101 , "Ravina" , 23 , "Female" , "Pune") ,
( 102 , "Viraj" , 34 , "Male" , "Mumbai") , 
( 103 , "Vandana" , 22 , "Female" , "Pune" ) ,
( 104 , "Madhuri" , 26, "Female" , "Delhi") ,
( 105 , "Nayan" , 28 , "Male" , "Pune") ,
( 106 , "Anushka" , 38 , "Female" , "Hyd") ,
( 107 , "Virat" , 18 , "Male" , "Delhi"),
( 108 , "Sakshi" , 21 , "Female" , "Pune") ;

# Courses 
insert into courses values 
( 1001 , "Data Science" , 60000 ) ,
( 1002 , "Data Analysis" , 45000 ) ,
( 1003 , "Cyber Security" , 35000 ) , 
( 1004 , "Generative AI" , 67000 ) ,
( 1005 , "Full Stack Devlopment" , 65000 ) , 
( 1006 , "DevOp's Eng" , 55000 ) , 
( 1007 , "Data Eng using Azure" , 65000 ) ;

# Admissions 
insert into admissions( stu_id , course_id , Fees_status , Duration , Location ) 
values 
( 103 , 1001 , "Paid" , 6 , "Pune" ) ,
( 106 , 1002 , "Pending"  , 7 , "Pune" ) ,
( 107 , 1007 , "Partially paid" , 6 , "Mumbai"),
( 101 , 1001 , "Paid" , 6 , "Pune") ,
( 103 , 1004 , "Partially Paid" , 6, "Pune" ) ,
( 105 , 1005 , "Paid", 4 , "Pune") ,
( 102 , 1002 , "Pending", 3 , "Pune") ,
( 104 , 1006 , "Paid" , 5 , "Pune" ) ,
( 106 , 1006  , "Pending" , 4 , "Pune");
