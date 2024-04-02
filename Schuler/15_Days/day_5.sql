SELECT
COUNT(total_amount),
CASE
WHEN total_amount < 20000 then 'low price ticket'
WHEN total_amount >= 20000 and total_amount < 150000 then 'mid price ticket'
ELSE 'high price ticket'
end as t_price
FROM bookings
group by t_price
order by 1 desc

SELECT
COUNT(scheduled_departure),
CASE
WHEN extract(month from scheduled_departure) in (7,8) then 'Summer'
ELSE 'Fall'
end as season
FROM flights
group by season
order by 1

SELECT
title,
CASE
WHEN rating in ('PG', 'PG-13') or length > 210 then 'Great rating or long (tier 1)'
WHEN description like '%Drama%' and length > 90 then 'Long drama (tier 2)'
WHEN description like '%Drama%' and length <= 90 then 'Short drama (tier 3)'
WHEN rental_rate < 1 then 'Very cheap (tier 4)'
-- ELSE 'Fall'
end as tier_list
FROM film
where CASE
WHEN rating in ('PG', 'PG-13') or length > 210 then 'Great rating or long (tier 1)'
WHEN description like '%Drama%' and length > 90 then 'Long drama (tier 2)'
WHEN description like '%Drama%' and length <= 90 then 'Short drama (tier 3)'
WHEN rental_rate < 1 then 'Very cheap (tier 4)'
end is not null

(see vid 8 for more)