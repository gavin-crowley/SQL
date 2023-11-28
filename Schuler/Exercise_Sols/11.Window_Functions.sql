-- select f.film_id, f.title, f.length, c.name as category,
-- round(avg(length) over(partition by c.category_id),2)
-- from film f
-- join film_category fc
-- on f.film_id = fc.film_id
-- join category c
-- on fc.category_id = c.category_id
-- order by f.film_id

-- select *,
-- count(*) over(partition by customer_id, amount) as
-- no_payments_with_that_amount
-- from payment
-- order by payment_id

-- SELECT *,
-- SUM(amount) OVER(PARTITION BY customer_id ORDER BY payment_date)
-- FROM payment


-- select *
-- select flight_id, departure_airport, 
-- sum(actual_arrival-scheduled_arrival) over (order by flight_id)
-- from flights

-- select flight_id, departure_airport, 
-- sum(actual_arrival-scheduled_arrival) over (order by departure_airport, flight_id)
-- from flights
























