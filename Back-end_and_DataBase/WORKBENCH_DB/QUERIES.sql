-- 7th task:-----------------------------------------------------
-- date:
	select type from services;
    
    select distinct services.type 
	from services,
	(select provided_to.ServiceID 
	from provided_to , (select SpaceID from visits where cast(Arrival_Date_time as date) = '2021-06-09') as pref
	where provided_to.PlaceID = pref.SpaceID) as pref1
	where services.ServiceID = pref1.ServiceID;
    
-- kind of service:
	select type from services where type = "hair saloon";
    
    select NFC_ID, SpaceID, Arrival_Date_time, Departure_Date_time from 
	visits, (select provided_to.PlaceID as PlaceID, services.type as type from services INNER JOIN provided_to ON services.ServiceID = provided_to.ServiceID WHERE services.type = 'hair saloon') as type_of_service
	WHERE 
	visits.SpaceID = type_of_service.PlaceID;
    
-- cost of service:

	select type, enroll_price
	from  services, (select * from enrolled_services where enroll_price <= 600.000) as cost_of_service
	where services.ServiceID = cost_of_service.ServiceID;
    
-- if more than 2 reqs then use union
-- 9th task:-----------------------------------------------------

    select * from visits where NFC_ID = 20;
    
    
    
-- 10th task:----------------------------------------------------

	

	select DISTINCT visits.NFC_ID, visits.SpaceID, visits.Arrival_Date_time, visits.Departure_Date_time
    from visits, (select * from visits where NFC_ID = 6) as infected
    where 
    infected.NFC_ID <> visits.NFC_ID 
    and 
    cast(infected.Arrival_date_time as date) = cast(visits.Arrival_date_time as date)
    and
    (
    -- for places of services
    (
    (infected.SpaceID BETWEEN 500 and 528) and infected.SpaceID = visits.SpaceID 
    and 
    ((SUBTIME(cast(visits.Arrival_date_time as time), cast(infected.Departure_date_time as time)) BETWEEN
    '00:00:00' and '02:00:00')
    or 
    (cast(infected.Arrival_date_time as time) BETWEEN cast(visits.Arrival_date_time as time) AND cast(visits.Departure_date_time as time))
    or 
    (cast(infected.Departure_date_time as time) BETWEEN cast(visits.Arrival_date_time as time) AND cast(visits.Departure_date_time as time))
    ))
    
    -- for rooms
    or
    (
    (infected.SpaceID BETWEEN 0 and 499)
    and 
    (
	 case
		when 0  <= (infected.SpaceID mod 100) <= 24 then visits.SpaceID BETWEEN ((infected.SpaceID div 100) * 100 +  0) and ((infected.SpaceID div 100) * 100 + 24)
        when 25 <= (infected.SpaceID mod 100) <= 49 then visits.SpaceID BETWEEN ((infected.SpaceID div 100) * 100 + 25) and ((infected.SpaceID div 100) * 100 + 49)
		when 50 <= (infected.SpaceID mod 100) <= 74 then visits.SpaceID BETWEEN ((infected.SpaceID div 100) * 100 + 50) and ((infected.SpaceID div 100) * 100 + 74)
        when 75 <= (infected.SpaceID mod 100) <= 99 then visits.SpaceID BETWEEN ((infected.SpaceID div 100) * 100 + 75) and ((infected.SpaceID div 100) * 100 + 99)
	 END
	)
     and
     ((SUBTIME(cast(visits.Arrival_date_time as time), cast(infected.Departure_date_time as time)) BETWEEN
    '00:00:00' and '05:00:00')
    or 
    (cast(infected.Arrival_date_time as time) BETWEEN cast(visits.Arrival_date_time as time) AND cast(visits.Departure_date_time as time))
    or 
    (cast(infected.Departure_date_time as time) BETWEEN cast(visits.Arrival_date_time as time) AND cast(visits.Departure_date_time as time))
    ))
    );
    
        

    
    
    
    
    
    
