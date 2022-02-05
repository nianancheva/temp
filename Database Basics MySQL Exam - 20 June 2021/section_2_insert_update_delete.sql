insert into clients (`full_name`, `phone_number`)
select 
concat_ws(' ', d.`first_name`, d.`last_name`),
concat ('(088) 9999', d.id * 2)
from `drivers` as d
where d.id BETWEEN 10 and 20
;

--

UPDATE cars
SET `condition` = 'C'
where `condition` != 'C'
and (
(`mileage` >= 800000
or `mileage` is null)
and (`year` <= 2010)
and (`make` != 'Mercedes-Benz'));

--

delete c from clients as c
left join courses as cr
on c.id = cr.client_id
where cr.client_id is null
and char_length(c.full_name) > 3;
