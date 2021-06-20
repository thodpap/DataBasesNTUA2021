-- below parameters are only for test (ex password and NFC_ID in first query for "update password query" )

-- update password query

-- parameters: password, NFC_ID
UPDATE customers set password = 'asfdsgewrgegrgw' where NFC_ID = 10;

-- login query

-- parameters: FirstName, LastName, password
select NFC_ID from customers where FirstName = ..... and LastName = ..... and password = ....;



-- 7th task:-----------------------------------------------------
-- date:
	  select type from services;
    
      
-- parameters: date
	  select FirstName, LastName, temp1.type, Arrival_Date_time, Departure_Date_time from
      customers,(
      select distinct NFC_ID, services.type, Arrival_Date_time, Departure_Date_time 
	  from services,
	  (select provided_to.ServiceID, NFC_ID, Arrival_Date_time, Departure_Date_time
	  from provided_to , (select SpaceID, NFC_ID, Arrival_Date_time, Departure_Date_time from visits where cast(Arrival_Date_time as date) = '2021-06-09') as pref
	  where provided_to.PlaceID = pref.SpaceID) as pref1
	  where services.ServiceID = pref1.ServiceID) as temp1
      where customers.NFC_ID = temp1.NFC_ID
      ;


    
-- kind of service:
	select type from services where type = "hair saloon";
    
-- parameters: type of service
    select FirstName, LastName, temp1.type, Arrival_Date_time, Departure_Date_time from
	customers,(
	select distinct NFC_ID, type, Arrival_Date_time, Departure_Date_time from (
    select NFC_ID, type, Arrival_Date_time, Departure_Date_time from 
	visits, (select provided_to.PlaceID as PlaceID, services.type as type from services INNER JOIN provided_to ON services.ServiceID = provided_to.ServiceID WHERE services.type = 'hair saloon') as type_of_service
	WHERE 
	visits.SpaceID = type_of_service.PlaceID
    ) as temp) as temp1
    where customers.NFC_ID = temp1.NFC_ID;

    
    
-- cost of service:

	select type, enroll_price
	from  services, (select * from enrolled_services where enroll_price <= 600.000) as cost_of_service
	where services.ServiceID = cost_of_service.ServiceID;
    
-- parameters: enroll_price
	select FirstName, LastName, temp1.type, Arrival_Date_time, Departure_Date_time from
	customers,(
	select distinct NFC_ID, type, Arrival_Date_time, Departure_Date_time from
    visits,
	(select provided_to.ServiceID, provided_to.PlaceID, type from provided_to, (select cost_of_service.ServiceID, enroll_price, type
	from  services, (select * from enrolled_services where enroll_price <= 600.000) as cost_of_service
	where services.ServiceID = cost_of_service.ServiceID) as temp where provided_to.ServiceID = temp.ServiceID) as temp1
    where visits.SpaceID = temp1.PlaceID) as temp1
    where temp1.NFC_ID = customers.NFC_ID;

-- 9th task:-----------------------------------------------------
	
-- parameters: NFC_ID
    select SpaceName, Arrival_Date_time, Departure_Date_time from 
    Places, (select * from visits where NFC_ID = 20) as temp
    where Places.PlaceID = temp.SpaceID;
    
    
    
-- 10th task:----------------------------------------------------

	
-- parameters: NFC_ID
	select FirstName, LastName, SpaceName, Arrival_Date_time, Departure_Date_time from 
    Places, 
    (select FirstName, LastName, SpaceID, Arrival_Date_time, Departure_Date_time from
    customers, (
    select DISTINCT for_aisle.NFC_ID, for_aisle.SpaceID, for_aisle.Arrival_Date_time, for_aisle.Departure_Date_time
    from (select * from for_aisle where NFC_ID = 48) as infected, for_aisle
    where 
    infected.NFC_ID <> for_aisle.NFC_ID 
    and 
    cast(infected.Arrival_date_time as date) = cast(for_aisle.Arrival_date_time as date)
    and
    (
    -- for places of services
    (
    (infected.SpaceID BETWEEN 500 and 528) and infected.SpaceID = for_aisle.SpaceID 
    and 
    ((SUBTIME(cast(for_aisle.Arrival_date_time as time), cast(infected.Departure_date_time as time)) BETWEEN
    '00:00:00' and '02:00:00')
    or 
    (cast(infected.Arrival_date_time as time) BETWEEN cast(for_aisle.Arrival_date_time as time) AND cast(for_aisle.Departure_date_time as time))
    or 
    (cast(infected.Departure_date_time as time) BETWEEN cast(for_aisle.Arrival_date_time as time) AND cast(for_aisle.Departure_date_time as time))
    ))
    
    -- for rooms
    or
    (
    (infected.SpaceID BETWEEN 0 and 499)
    and 
    (
    (infected.SpaceID div 100) = (for_aisle.SpaceID div 100)
    ) 
	and
    (
    (infected.aisle = for_aisle.aisle)
    )
     and
     ((SUBTIME(cast(for_aisle.Arrival_date_time as date), cast(infected.Departure_date_time as date)) BETWEEN
    '00:00:00' and '24:00:00')
    or 
    (cast(infected.Arrival_date_time as time) BETWEEN cast(for_aisle.Arrival_date_time as time) AND cast(for_aisle.Departure_date_time as time))
    or 
    (cast(infected.Departure_date_time as time) BETWEEN cast(for_aisle.Arrival_date_time as time) AND cast(for_aisle.Departure_date_time as time))
    ))
    )) as temp1
    where customers.NFC_ID = temp1.NFC_ID) as temp2
    where temp2.SpaceID = Places.PlaceID;
    
        
-- 11th task:----------------------------------------------------

-- 1st

-- parameters: age between (ex 40 and 60)
select SpaceName, counter from places, 
(select spaceid, counter
from (select count(NFC_ID) as counter, temp.SpaceID, Arrival_Date_time 
from (select visits.NFC_ID, Age, visits.SpaceID, Arrival_Date_time from customers INNER JOIN visits on customers.NFC_ID = visits.NFC_ID) as temp 
where 
(age between 40 and 60) 
-- age > 60
and 
(spaceid between 500 and 528)
and
(month(Arrival_Date_time) = 10) 
and 
(year(Arrival_Date_time) = 2021) 
group by spaceid
order by counter DESC) as temp1) as temp2
where places.PlaceID = temp2.SpaceID;
-- 2ond

-- parameters: age between (ex 40 and 60)
select type, counter, charge_Date_time from services,
(select temp.ServiceID, count(charge) as counter, charge_Date_time 
from (select charge, charge_of_service.NFC_ID, Age, charge_of_service.ServiceID, charge_Date_time from customers INNER JOIN charge_of_service on customers.NFC_ID = charge_of_service.NFC_ID) as temp 
where 
(age between 40 and 60) 
-- age > 60
and
(ServiceID between 1 and 6)
and 
(month(charge_Date_time) = 10) 
and 
(year(charge_Date_time) = 2021) 
group by ServiceID
order by counter DESC) as temp2
where services.ServiceID = temp2.ServiceID;

-- 3rd

-- parameters: (ex between 40 and 60)
select type, max_used 
from services, (select count(NFC_ID) as max_used, ServiceID FROM 
(SELECT distinct NFC_ID, ServiceID  FROM 
(SELECT ServiceID, ch.NFC_ID  
FROM charge_of_service AS ch INNER JOIN customers AS c ON ch.NFC_ID=c.NFC_ID 
WHERE (age BETWEEN " + low + " AND " + high + ") AND (month(charge_date_time) = 10) AND (year(charge_date_time) = 2021)) as temp ) as 
temp1 GROUP BY ServiceID order by max_used DESC) as temp2 where services.ServiceID = temp2.ServiceID;




    
    
    
    
    
    
