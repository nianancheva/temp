CREATE FUNCTION `udf_courses_by_client` (phone_num VARCHAR (20))
RETURNS INTEGER
DETERMINISTIC
BEGIN
RETURN 
(select count(cr.id) as `count`
from clients as cl
join courses as cr
on cl.id = cr.client_id
group by phone_number
having phone_number = phone_num);
END

--

CREATE PROCEDURE `udp_courses_by_address`(address_name VARCHAR(100))
BEGIN
select ad.`name`, cl.`full_name`,
(case
when cr.bill <= 20 then 'Low'
when cr.bill <= 30 then 'Medium'
else 'High'
end) as `level_of_bill`,
c.`make`, c.`condition`, cat.`name`
from addresses as ad
join courses as cr
on ad.id = cr.from_address_id
join clients as cl
on cr.client_id = cl.id
join cars as c
on cr.car_id = c.id
join categories as cat
on c.category_id = cat.id
where ad.`name` = address_name
order by c.make, cl.`full_name`;
END
