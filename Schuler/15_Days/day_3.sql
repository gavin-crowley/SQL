select customer_id, date(payment_date), round(avg(amount),2), count(amount) 
from payment
-- where date(payment_date) in ('2020-04-28', '2020-04-29', '2020-04-30')
where date(payment_date) between '2020-04-28' and '2020-04-30 23:59:59'
group by customer_id, date(payment_date)
having count(amount) > 1 
order by 3 desc






