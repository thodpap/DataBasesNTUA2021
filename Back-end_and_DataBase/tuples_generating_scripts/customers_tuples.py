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

    # cursor = connection.cursor()
    cursor = connection.cursor(buffered=True)
    curs = connection.cursor()

    str_services = "SELECT * " \
                   "FROM services;"

    str_places = "SELECT *" \
                 "FROM places;"

    cursor.execute(str_places)
    places = cursor.fetchall()
    cursor.execute(str_services)
    services = cursor.fetchall()
    # print(type(places))
    print(services)
    print(places)
    #
    # print((places[0][1]))

    query_provided_to_format = ("INSERT INTO provided_to "
                                "values {};")

    for i in range(len(places)):
        for j in range(len(services)):
            if (places[i][1][:4] == 'room') and (services[j][1] == 'accommodation in a room'):
                data = (services[j][0], places[i][0])
                curs.execute(query_provided_to_format.format(data))
                connection.commit()

            if (places[i][1][:6] == 'saouna') and (services[j][1] == 'saouna'):
                data = (services[j][0], places[i][0])
                curs.execute(query_provided_to_format.format(data))
                connection.commit()

            #for meeting room
            if (places[i][1][:12] == 'meeting room') and (services[j][1] == 'meeting room'):
                data = (services[j][0], places[i][0])
                curs.execute(query_provided_to_format.format(data))
                connection.commit()

            if (places[i][1][:3] == 'bar') and (services[j][1] == 'food-cocktail in bar'):
                data = (services[j][0], places[i][0])
                curs.execute(query_provided_to_format.format(data))
                connection.commit()

            if (places[i][1][:10] == 'restaurant') and (services[j][1] == 'food-cocktail in restaurant'):
                data = (services[j][0], places[i][0])
                curs.execute(query_provided_to_format.format(data))
                connection.commit()

            if (places[i][1] == 'hair_saloon') and (services[j][1] == 'hair saloon'):
                data = (services[j][0], places[i][0])
                curs.execute(query_provided_to_format.format(data))
                connection.commit()

            if (places[i][1][:3] == 'gym') and (services[j][1] == 'gym'):
                data = (services[j][0], places[i][0])
                curs.execute(query_provided_to_format.format(data))
                connection.commit()

    if connection.is_connected():
        cursor.close()
        curs.close()
        connection.close()
        print("done")


except mysql.connector.Error as err:
    print("Something went wrong: {}".format(err))
