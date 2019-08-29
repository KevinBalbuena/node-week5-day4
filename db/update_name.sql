update student_data
set student = $1
where student_id = $2;

select * from student_data;