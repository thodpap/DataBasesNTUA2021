import mysql.connector
import names
import random
import datetime

try:
    connection = mysql.connector.connect(
        host='localhost',
        database='databases2021',
        user='root',
        password='DB2021'
    )

    cursor = connection.cursor()


    counter = -1

    #rooms generator
    #number of bes = number of beds in each room for this specific ailse
    query_places_room_format = ("INSERT INTO places(SpaceId, SpaceName , number_of_beds, ailse, elevator) "
                                "values {};")

    ailes = ["W", "E", "S", "N"]
    number_of_beds = [1, 2, 3, 4]
    elevators = [1, 2, 3, 4]

    for i in range(5):
        pivot = 0
        for j in range(100):
            counter += 1

            if j % 25 == 0:
                pivot += 1

            data = (counter, "room " + str(i) + str(j), number_of_beds[pivot-1], ailes[pivot-1], elevators[pivot-1])
            cursor.execute(query_places_room_format.format(data))
            connection.commit()

            if i == 5 and j == 99:
                break



    #hair saloon generator
    counter += 1
    query_places_hair_saloon_format = ("INSERT INTO places(SpaceId, SpaceName, groundfloor, number_of_beds) "
                                       "values {};")

    cursor.execute(query_places_hair_saloon_format.format((counter, "hair_saloon", 1, 0)))
    connection.commit()


    #bars generator
    query_places_bar_format = ("INSERT INTO places(SpaceId, SpaceName, groundfloor, number_of_beds) "
                               "values {};")



    for i in range(6):
        counter += 1
        cursor.execute(query_places_bar_format.format((counter, "bar " + str(i), 1, 0)))
        connection.commit()


    #restaurant generator
    query_places_restaurant_format = ("INSERT INTO places(SpaceId, SpaceName, groundfloor, number_of_beds) "
                                      "values {};")


    for i in range(4):
        counter += 1
        cursor.execute(query_places_restaurant_format.format((counter, "restaurant " + str(i), 1, 0)))
        connection.commit()


    #meeting room generator
    query_places_meeting_room_format = ("INSERT INTO places(SpaceId, SpaceName, groundfloor, number_of_beds) "
                                        "values {};")

    for i in range(10):
        counter += 1
        cursor.execute(query_places_meeting_room_format.format((counter, "meeting room " + str(i), 1, 0)))
        connection.commit()



    #gym generator
    query_places_gym_format = ("INSERT INTO places(SpaceId, SpaceName, groundfloor, number_of_beds) "
                               "values {};")

    for i in range(4):
        counter += 1
        cursor.execute(query_places_gym_format.format((counter, "gym " + str(i), 1, 0)))
        connection.commit()


    #saouna generator
    query_places_saouna_format = ("INSERT INTO places(SpaceId, SpaceName, groundfloor, number_of_beds) "
                                  "values {};")

    for i in range(4):
        counter += 1
        cursor.execute(query_places_saouna_format.format((counter, "saouna " + str(i), 1, 0)))
        connection.commit()




    if connection.is_connected():
        cursor.close()
        connection.close()
        print("done")

except mysql.connector.Error as err:
    print("Something went wrong: {}".format(err))
