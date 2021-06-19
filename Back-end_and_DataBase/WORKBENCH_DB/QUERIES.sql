-- update password query

UPDATE customers set password = 'asfdsgewrgegrgw' where NFC_ID = 10;



-- 7th task:-----------------------------------------------------
-- date:
	select type from services;
    
      select distinct NFC_ID, services.type, NFC_ID, Arrival_Date_time, Departure_Date_time 
	  from services,
	  (select provided_to.ServiceID, NFC_ID, Arrival_Date_time, Departure_Date_time
	  from provided_to , (select SpaceID, NFC_ID, Arrival_Date_time, Departure_Date_time from visits where cast(Arrival_Date_time as date) = '2021-06-09') as pref
	  where provided_to.PlaceID = pref.SpaceID) as pref1
	  where services.ServiceID = pref1.ServiceID;



    
-- kind of service:
	select type from services where type = "hair saloon";
    
	select distinct NFC_ID, type, Arrival_Date_time, Departure_Date_time from (
    select NFC_ID, type, Arrival_Date_time, Departure_Date_time from 
	visits, (select provided_to.PlaceID as PlaceID, services.type as type from services INNER JOIN provided_to ON services.ServiceID = provided_to.ServiceID WHERE services.type = 'hair saloon') as type_of_service
	WHERE 
	visits.SpaceID = type_of_service.PlaceID
    ) as temp;

    
    
-- cost of service:

	select type, enroll_price
	from  services, (select * from enrolled_services where enroll_price <= 600.000) as cost_of_service
	where services.ServiceID = cost_of_service.ServiceID;
    
	select distinct NFC_ID, type, Arrival_Date_time, Departure_Date_time from
    visits,
	(select provided_to.ServiceID, provided_to.PlaceID, type from provided_to, (select cost_of_service.ServiceID, enroll_price, type
	from  services, (select * from enrolled_services where enroll_price <= 600.000) as cost_of_service
	where services.ServiceID = cost_of_service.ServiceID) as temp where provided_to.ServiceID = temp.ServiceID) as temp1
    where visits.SpaceID = temp1.PlaceID;

-- 9th task:-----------------------------------------------------
	
    select SpaceName, NFC_ID, Arrival_Date_time, Departure_Date_time from 
    Places, (select * from visits where NFC_ID = 20) as temp
    where Places.PlaceID = temp.SpaceID;
    
    
    
-- 10th task:----------------------------------------------------

	

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
    );
    
        
-- 11th task:----------------------------------------------------

-- 1st
select spaceid
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
order by counter DESC
LIMIT 1) as temp1;

-- 2ond

select count(charge) as counter, temp.ServiceID, charge_Date_time 
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
order by counter DESC;

-- 3rd
select count(NFC_ID) as max_used, ServiceID 
 FROM (SELECT distinct NFC_ID, ServiceID 
       FROM (SELECT ServiceID, ch.NFC_ID 
             FROM charge_of_service AS ch INNER JOIN customers AS c ON ch.NFC_ID=c.NFC_ID
             WHERE (age BETWEEN 40 AND 60) AND (month(charge_date_time) = 10) AND (year(charge_date_time) = 2021)
             ) as temp
			) as temp1 GROUP BY ServiceID order by max_used DESC;




    
    
    
    
    
    
