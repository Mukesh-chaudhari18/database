# Update - DML commands 
# Used to Update the information by the 
# condition in where clause 
# syntax - update table_name 
#     set col = "new value" , col2 = "NV", .....
#          where condition ; 

# Q1. update the name as - Hanuman where stu_id is 102 
update students set student_name = "Hanuman" 
where student_id = 102 ; 

# Q2. Update the name , age amd gender and city as 
#    "Vikas" , 45 , "Male" , "Los Angels" where 
# student_id is 105.
update students set 
student_name = "Vikas" , Age = 45 , Gender = "Male" ,
City = "Los Angels" 
where student_id = 105;
 
# Q3. Update the course fees as 150000 
#     where the course_name is "Generative AI".
# Q4. update course name as "Cyber Security with Gen AI" 
#     where course id is 1003.

# Warning - Where without condition 
# Never use Update - can lead to change in all the data 
# in that certain column 

####################################

# Delete - DML commands 
# Used to delete a row by where condition 
# syntax - delete from table where condition ; 

# Q1. student_id 101 delete it 
delete from students where student_id = 101 ;
# Cannot delete a information from parent table 
# if it is refered somewhere else 

# Q2. delete a row from admissions where ad_id = 9 
delete from admissions where admission_id = 9 ;
# When a table is not refered anywhere the information 
# from such table can be deleted 

# Q3. Delete a course_id = 1002 
delete from courses where course_id = 1002 ;
# When the reference rule is on delete cascade 
# deleting information from parent is allowed 
# and this will also remove all the data that present
# in the child table.

# Warning - delete without where clause 
# This will remove all the information from a table 
# Behave like truncate 

############################################

# Alter - DDL command
# Table modification command 
# Perform the following operations 
# 1. Add column 
# 2. datatypes modification in column 
# 3. rename the column and table 
# 4. Drop the column 

# 1. Alter + add column - 
alter table students add column 
phone_no int ;
# Q2. Add  duration int column into courses 
# Q3. Add education varchar(40) into students 
# Q4. Add trainer_name varchar(30) in admissions  

# 2. Alter + datatype modification 
alter table students modify 
Age smallint; 
# Q2. change the gender datatype to text
# Q3. make city as char(20) 
# Q4. make fees as double(10,2) 
# Q5. Make fees_Status as text 

# 3. Alter + rename column / table 
alter table students rename column 
student_name to user_name ; # column 

alter table students rename to user ;  # table rename 

# Q2. students - city --- Location 
# Q3. students - phone_no --- contact 
# Q4. rename courses table to modules 
# Q5. rename admissions  table to enrollments 

# 4. Alter + Drop column 
alter table user drop column gender ; 

# Q2. Drop the contact column in students 
# Q3. drop the Fees_status column 
# Q4. Drop the duration and location from admissions 
