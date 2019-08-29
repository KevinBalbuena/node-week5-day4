drop table if exists campus_data;

create table campus_data
(
    campus_id serial primary key,
    campus text not null,
    program varchar(10) not null,
    campus_phone text not null
);

insert into campus_data
    (campus, program, campus_phone)
values
    ('Phoenix', 'web', '867-5309'),
    ('Provo', 'web', '666-6666'),
    ('Dallas', 'ios', '555-5555');

select *
from campus_data;

create table student_data
(
    student_id serial primary key,
    student text not null,
    cohort integer not null,
    campus_id integer not null references campus_data(campus_id)
);

insert into student_data
    (student, cohort, campus_id)
values
    ('josh', 3, 1),
    ('john', 7, 1),
    ('jacob', 10, 2),
    ('jingle', 13, 3),
    ('heimer', 29, 1),
    ('schmidt', 8, 2),
    ('frodo', 3, 1),
    ('gandaaaalf', 3, 1); 