select substring(email from 1 for 1) || '***' || '.' 
|| substring(email from (position('.' in email) + 1 ) for 1) || '***'
|| substring(email from (position('@' in email)))
from customer


select '***' || substring(email from (position('.' in email) - 1 ) for 1) 
|| '.' || substring(email from (position('.' in email) + 1 ) for 1) || '***'
|| substring(email from (position('@' in email)))
from customer