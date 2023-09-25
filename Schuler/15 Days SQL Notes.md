
db: structured (columns & rows)

DBMS:
PostgreSQL
MySQL
SQLServer
MongoDB
MariaDB

-different dialects
schemas help structure db like folders on pc

3 character string:
WHERE name LIKE '_ _ _'

DATE() extracts date from timestamp

HAVING is used to filter groupings by aggregations, only use with GROUP BY

\i -> execute command

\i 'C:/Users/gavin/Downloads/[FreeCourseSite.com] Udemy - 15 Days of SQL The Complete SQL Masterclass 2023/3. Day 3 - Basics Grouping/13.1 flight_database/flight_database.sql'



DAY 4

Concatenate:
anonymized email
left(email,1) || '***' || right(email, 19)

Extract name from email:
last_name || ', ' ||left(email, position('.' in email)-1)

Substring:
substring(email from position('.' in email) - 1 for 1)

https://www.postgresqltutorial.com/postgresql-date-functions/postgresql-extract/

https://www.postgresqltutorial.com/postgresql-string-functions/postgresql-to_char/

TO_CHAR:
select 
sum(amount) as total_amount,
to_char(payment_date,'Dy,DD/MM/YYYY') as day
from 
payment
group by day
order by total_amount

select 
sum(amount) as total_amount,
to_char(payment_date,'Dy, HH:MI') as day
from 
payment
group by day
order by total_amount desc

select
current_timestamp
from 
rental

5. Day 5 - Intermediate Conditional Expressions

Case Ex 1:
1st stage (categorical):
SELECT
rating,
CASE
WHEN rating in ('PG', 'G') then 1
ELSE 0
END
FROM film

Ex:2
2nd (the sum):
SELECT
sum(CASE
WHEN rating in ('PG', 'G') then 1
ELSE 0
END) as no_of_ratings_with_g_or_pg
FROM film
----

Case Ex 3:
returns two colums of ratings COUNTs:
SELECT
rating,
COUNT(*)
FROM film
GROUP BY rating

Ex 4:
pivot with Case:
SELECT
sum(CASE WHEN rating = 'G' then 1 ELSE 0 END) as "G",
sum(CASE WHEN rating = 'R' then 1 ELSE 0 END) as "R",
sum(CASE WHEN rating = 'NC-17' then 1 ELSE 0 END) as "NC-17",
sum(CASE WHEN rating = 'PG-13' then 1 ELSE 0 END) as "PG-13",
sum(CASE WHEN rating = 'PG' then 1 ELSE 0 END) as "PG"
FROM film

---

Ex 5:
SELECT
amount,
CASE
WHEN amount < 2 THEN 'low amount'
WHEN amount < 5 THEN 'medium amount'
ELSE 'high amount'
END
FROM payment

---
Ex 6:
SELECT
TO_CHAR(book_date, 'Dy'),
TO_CHAR(book_date, 'Mon'),
CASE
WHEN TO_CHAR(book_date, 'Dy')='Mon' THEN 'Monday special'
WHEN TO_CHAR(book_date, 'Mon')='Jul' THEN 'July special'
ELSE 'no special'
END
FROM bookings

----

Ex 7:
SELECT
total_amount,
TO_CHAR(book_date, 'Dy'),
CASE
WHEN TO_CHAR(book_date, 'Dy')='Mon' THEN 'Monday special'
WHEN total_amount*1.4 < 30000 THEN 'Special deal'
ELSE 'no special at all'
END
FROM bookings

----

Ex 8:
SELECT
COUNT(*) AS flights,
CASE
WHEN actual_departure is null then 'no departure time'
WHEN actual_departure-scheduled_departure < '00:05' then 'On time'
WHEN actual_departure-scheduled_departure < '01:00' then 'A little bit late'
ELSE 'Very late'
END AS is_late
FROM flights
GROUP BY is_late

----

Ex 9: Group flights by season
SELECT
COUNT(*) AS flights,
CASE
WHEN EXTRACT(MONTH from scheduled_departure) IN (3, 4, 5) THEN 'Spring'
WHEN EXTRACT(MONTH from scheduled_departure) IN (6, 7, 8) THEN 'Summer'
WHEN EXTRACT(MONTH from scheduled_departure) IN (9, 10, 11) THEN 'Fall'
WHEN EXTRACT(MONTH from scheduled_departure) IN (11, 1, 2) THEN 'Winter'
END AS season
FROM flights
GROUP BY season

----

Ex 10:
-- Can't filter with Aliases! so must copy CASE condition:
SELECT
title,
CASE
WHEN rating = 'PG' OR rating = 'PG-13' OR LENGTH > 210 THEN 'tier 1'
WHEN description LIKE '%Drama%' AND LENGTH > 90 THEN 'tier 2'
WHEN description LIKE '%Drama%' AND LENGTH <= 90 THEN 'tier 3'
WHEN rental_rate < 1 THEN 'tier 4'
-- ELSE null
END AS tier_list
FROM film
WHERE
CASE
WHEN rating = 'PG' OR rating = 'PG-13' OR LENGTH > 210 THEN 'tier 1'
WHEN description LIKE '%Drama%' AND LENGTH > 90 THEN 'tier 2'
WHEN description LIKE '%Drama%' AND LENGTH <= 90 THEN 'tier 3'
WHEN rental_rate < 1 THEN 'tier 4'
-- ELSE null
END is not null

--------------------------------------

COALESE:
Can populate NULLS with this

CAST:
Change data type

SELECT
COALESCE(CAST(actual_arrival-scheduled_arrival as VARCHAR), 'not arrived')
FROM flights

SELECT
LENGTH(CAST(actual_arrival AS VARCHAR))
FROM flights


SELECT
CAST(REPLACE(passenger_id, ' ', '' ) AS BIGINT)
FROM tickets


---------------------------------------

6. Day 6 - Intermediate Joins

select
fare_conditions,
count(*)
from seats s
inner join boarding_passes s
on s.seat_no = b.seat_no
group by 1


LEFT OUTER JOIN <=> LEFT JOIN
RIGHT OUTER JOIN <=> RIGHT JOIN

Just use LEFT JOIN with tables reversed, instead of RIGHT JOIN

----

Multiple Join Conditions

Primary key uniquely identifies every row
If PK not unique another PK can be used

select
b.seat_no, avg(t.amount)
from ticket_flights t
join boarding_passes b
on t.ticket_no = b.ticket_no
and t.flight_id = b.flight_id
group by 1
order by 2 desc

----

Join Mulitple Tables
-mulitple inner joins, order doesn't matter

---------------------------

7. Day 7 - Advanced UNION & Subqueries

Union 
- make sure same order of selected columns
- data types must match 
- no duplicates in output
- use UNION ALL if want duplicates

Subqueries 
- a query within a query

where clause: query from a table
from clause: query from a subquery

Return all films that are in the inventory in store 2 more than 3 times:
select * from film
where film_id in (
	select film_id
	from inventory 
	where store_id = 2
	group by film_id
	having count(*) > 3
)

select
first_name, last_name
from 
customer
where customer_id in (
	select customer_id
	from payment
	where date(payment_date) = '2020-01-25'
)

select
first_name, email
from 
customer
where customer_id in (
	select customer_id
	from payment
	group by customer_id
	having sum(amount) > 30
)

select
first_name, last_name
-- *
from 
customer
where address_id in(
	select address_id 
	from address
	where district = 'California'
)
and
customer_id in (
	select customer_id
	from payment
	group by customer_id
	having sum(amount) > 100
)
order by 1



Subqueries in FROM: (query from a subquery)

Example:
Average lifetime spend for all customers:

SELECT ROUND(AVG(total_amount),2)
FROM (SELECT customer_id, SUM(amount) AS total_amount
	  FROM payment
	  GROUP BY customer_id) AS subquery


ADVANCED PROJECT:
1:
select 
distinct replacement_cost
from
film
order by 1
limit 1








