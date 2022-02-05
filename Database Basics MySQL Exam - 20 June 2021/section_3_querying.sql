select `make`, `model`, `condition`
from `cars`
order by id;

--

select d.first_name, d.last_name,
c.make, c. model, c.mileage
from drivers as d
join cars_drivers as cd
on d.id = cd.driver_id
join cars as c
on c.id = cd.car_id
where mileage is not null
order by mileage desc, first_name asc;

--

select c.id, make, mileage,
count(cr.id) as `count_of_courses`,
round(avg(cr.bill), 2) as `avg_bill`
from cars as c
left join courses as cr
on 
c.id = cr.car_id
group by c.id
having `count_of_courses` != 2
order by `count_of_courses` desc, c.id;

--

select full_name,
count(cr.id) as `count_of_cars`,
sum(cr.bill) as `total_sum`
from clients as cl
join courses as cr
on cl.id = cr.client_id
join cars as c
on c.id = cr.car_id
group by cl.id
having substring(full_name, 2, 1) = 'a'
and `count_of_cars` > 1
order by full_name;

--

select ad.`name`, 
(case 
when hour(cr.`start`) between 6 and 20 then 'Day'
else 'Night' end) as `day_time`,
cr.bill, cl.full_name, c.make, c.model, cat.`name`
from courses as cr
join addresses as ad
on cr.from_address_id = ad.id
join cars as c
on cr.car_id = c.id
join clients as cl
on cr.client_id = cl.id
join categories as cat
on c.category_id = cat.id
order by cr.id;
