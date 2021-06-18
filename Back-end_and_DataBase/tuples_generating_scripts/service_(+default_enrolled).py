import mysql.connector
import names
import random
import datetime

try
    connection = mysql.connector.connect(
        host='localhost',
        database='databases2021',
        user='root',
        password='DB2021'
    )

    cursor = connection.cursor()

    query_services_format = (INSERT INTO services 
                             values {};)
    query_services_free_format = (INSERT INTO default_services 
                                  values {};)

    query_services_enrolled_format = (INSERT INTO enrolled_services 
                                      values {};)

    free_serv = ["food-cocktail in bar", "food-cocktail in restaurant", "hair saloon"]
    enrolled_serv = ["gym", "saouna", "meeting room"]


    counter = 0
    for i in range(1, len(free_serv) + len(enrolled_serv) + 1)
        if i = len(free_serv)
            data = (i, free_serv[i-1])
            cursor.execute(query_services_format.format(data))
            connection.commit()
            data = (i, random.randint(0, 6))
            cursor.execute(query_services_free_format.format(data))
            connection.commit()
            counter += 1

        else
            data = (i, enrolled_serv[i-counter-1])
            cursor.execute(query_services_format.format(data))
            connection.commit()

            cursor.execute(query_services_enrolled_format.format((i, 1000random.random())))
            connection.commit()




    if connection.is_connected()
        cursor.close()
        connection.close()
        print(done)

except mysql.connector.Error as err
    print(Something went wrong {}.format(err))
