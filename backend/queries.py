
######################################
#   7th task - Q1 - Get track visits #
######################################

def getTrackVisitsDate(date):
    return ("select type from services; " +
        "select FirstName, LastName, temp1.type, Arrival_Date_time, Departure_Date_time from"/
        "customers,(" /
        "select distinct NFC_ID, services.type, Arrival_Date_time, Departure_Date_time"/
        "from services,"/
        "(select provided_to.ServiceID, NFC_ID, Arrival_Date_time, Departure_Date_time"/
        "from provided_to , (select SpaceID, NFC_ID, Arrival_Date_time, Departure_Date_time from visits where cast(Arrival_Date_time as date) = '" + date + "') as pref"/
        "where provided_to.PlaceID = pref.SpaceID) as pref1"/
        "where services.ServiceID = pref1.ServiceID) as temp1"/
        "where customers.NFC_ID = temp1.NFC_ID;")


def getTrackVisitsService(room):
    return (
        "select type from services where type = " + room + ";"/
        "select FirstName, LastName, temp1.type, Arrival_Date_time, Departure_Date_time from"/
        "customers,("/
        "select distinct NFC_ID, type, Arrival_Date_time, Departure_Date_time from ("/
        "select NFC_ID, type, Arrival_Date_time, Departure_Date_time from"/
        "visits, (select provided_to.PlaceID as PlaceID, services.type as type from services INNER JOIN provided_to ON services.ServiceID = provided_to.ServiceID WHERE services.type = " + room + ") as type_of_service"/
        "WHERE"/
        "visits.SpaceID = type_of_service.PlaceID"/
        ") as temp) as temp1"/
        "where customers.NFC_ID = temp1.NFC_ID;"
    )

def getTrackVisitsCost(operator, cost):
    return (
        "select type, enroll_price"/
        "from  services, (select * from enrolled_services where enroll_price " + operator + " " + str(cost) +" as cost_of_service"/
        "where services.ServiceID = cost_of_service.ServiceID;"/
        "select FirstName, LastName, temp1.type, Arrival_Date_time, Departure_Date_time from"/
        "customers,("/
        "select distinct NFC_ID, type, Arrival_Date_time, Departure_Date_time from"/
        "visits,"/
        "(select provided_to.ServiceID, provided_to.PlaceID, type from provided_to, (select cost_of_service.ServiceID, enroll_price, type"/
        "from  services, (select * from enrolled_services where enroll_price " + operator + " " + str(cost) + ") as cost_of_service"/
        "where services.ServiceID = cost_of_service.ServiceID) as temp where provided_to.ServiceID = temp.ServiceID) as temp1"/
        "where visits.SpaceID = temp1.PlaceID) as temp1"/
        "where temp1.NFC_ID = customers.NFC_ID;"
    ) 


############################################
#   8th task - Q2a - Get sells per service #
############################################
# def getSellsPerService()
