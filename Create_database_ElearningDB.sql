-- Create database ElearningDB
create database ElearningDB;
-- Create schema elearning
create schema elearning;
-- Create table Students
create table elearning.students(
	student_id bigserial primary key,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	email varchar(200) not null unique
);
-- Create table Instructors
create table elearning.Instructors(
	instructor_id bigserial primary key,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	email varchar(200) not null unique
);
-- Create table Courses
create table elearning.courses(
	course_id bigserial primary key,
	course_name varchar(100) not null,
	instructor_id bigint not null references elearning.instructors(instructor_id)
);
-- Create table Enrollments
create table elearning.enrollments(
	enrollment_id bigserial primary key,
	student_id bigint not null references elearning.students(student_id),
	course_id bigint not null references elearning.courses(course_id),
	enroll_date timestamp not null
);
-- Create table Assignments
create table elearning.assignments(
	assignment_id bigserial primary key,
	course_id bigint not null references elearning.courses(course_id),
	title varchar(100) not null,
	due_date timestamp not null
);
-- Create table Submissions
create table elearning.submissions(
	submission_id bigserial primary key,
	assignment_id bigint not null references elearning.assignments(assignment_id),
	student_id bigint not null references elearning.students(student_id),
	submission_date timestamp not null,
	grade numeric(5, 2) default 0 not null check(grade >= 0 and grade <= 100)
);