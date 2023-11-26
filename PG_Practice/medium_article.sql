-- CREATE TABLE event (
-- 	event_id SERIAL,
-- 	employee_id SERIAL,
-- 	customer_id SERIAL,
-- 	event VARCHAR(50),
-- 	timestamp DATE
-- )

-- CREATE TABLE employees (
-- 	emp_id SERIAL,
-- 	name VARCHAR(50),
-- 	position VARCHAR(50),
-- 	salary INTEGER
-- )

-- COPY event(event_id,employee_id,customer_id,event,timestamp)
-- FROM 'C:\Users\gavin\Documents\SQL\PG_Practice\event.csv'
-- DELIMITER ','
-- CSV HEADER;


-- \copy event (event_id,employee_id,customer_id,event,timestamp) from 'C:/Users/gavin/Documents/SQL/PG_Practice/event.csv'
-- delimiter ',' CSV HEADER;

-- #1
-- select count(*) from event
-- select event, count(*)
-- from event
-- group by event


-- #2
-- select customer_id, date(timestamp), count(*)
-- from event
-- group by customer_id, date(timestamp)
-- order by 3 desc

-- #3
-- select employee_id, count(*), name
-- from event ev
-- inner join employees em
-- on ev.employee_id = em.emp_id
-- group by employee_id, name
-- order by 2 desc

-- #4
-- select position, round(avg(salary))
-- from employees
-- group by position
-- order by 2 desc

-- select position, round(avg(salary))
-- from employees
-- group by position
-- order by 2 desc
























































































