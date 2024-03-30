select count(*) as no_of_movies
from film
where description like '%Saga%'
and (title like 'A%' or title like '%R')
--14

select *
from customer
where first_name like '%ER%' and first_name like '_A%'
order by last_name desc

select count(*)
from payment
where amount = 0 or (amount between 3.99 and 7.99 )
and payment_date between '2020-05-01' and '2020-05-02'