select substring(email from 1 for 1) || '***' || '.' 
|| substring(email from (position('.' in email) + 1 ) for 1) || '***'
|| substring(email from (position('@' in email)))
from customer


select '***' || substring(email from (position('.' in email) - 1 ) for 1) 
|| '.' || substring(email from (position('.' in email) + 1 ) for 1) || '***'
|| substring(email from (position('@' in email)))
from customer


select extract(dow from payment_date), sum(amount)
from payment
group by 1
order by 2 desc


select sum(amount), to_char(payment_date, 'Dy, DD/MM/YYYY')
from payment
group by 2
order by 1 asc


select sum(amount), to_char(payment_date, 'Mon, YYYY')
from payment
group by 2
order by 1 asc

select sum(amount), to_char(payment_date, 'Dy, HH:MI')
from payment
group by 2
order by 1 desc

select customer_id, return_date - rental_date 
from rental
where customer_id = 35
order by 1 desc


select customer_id, avg(return_date - rental_date) 
from rental
group by 1
order by 2 desc
