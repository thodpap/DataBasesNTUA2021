import mysql.connector
import random

try:
    connection = mysql.connector.connect(
        host='localhost',
        database='databases2021',
        user='root',
        password='DB2021'
    )

    cursor = connection.cursor()

    typeofservice = ("SELECT type "
                     "FROM services; ")

    cursor.execute(typeofservice)
    typeofservice1 = cursor.fetchall()

    print(typeofservice1)

    charge_of_service = "SELECT visits.NFC_ID,provided_to.ServiceID,visits.Arrival_Date_time FROM visits INNER JOIN " \
                        "provided_to ON visits.SpaceID = provided_to.PlaceID "

    cursor.execute(charge_of_service)
    charge_of_service1 = cursor.fetchall()

    for charge in charge_of_service1:
        if charge[1] == 1:
            charge1 = (charge[0], charge[1], str(charge[2]), typeofservice1[0][0], random.randint(8, 30))
            query2 = "INSERT INTO charge_of_service VALUES {};".format(charge1)
            cursor.execute(query2)
            connection.commit()

        elif charge[1] == 2:
            charge1 = (charge[0], charge[1], str(charge[2]), typeofservice1[1][0], random.randint(5, 60))
            query2 = "INSERT INTO charge_of_service VALUES {};".format(charge1)
            cursor.execute(query2)
            connection.commit()

        elif charge[1] == 3:
            charge1 = (charge[0], charge[1], str(charge[2]), typeofservice1[2][0], random.randint(10, 50))
            query2 = "INSERT INTO charge_of_service VALUES {};".format(charge1)
            cursor.execute(query2)
            connection.commit()

        elif charge[1] == 4:
            charge1 = (charge[0], charge[1], str(charge[2]), typeofservice1[3][0], 15)
            query2 = "INSERT INTO charge_of_service VALUES {};".format(charge1)
            cursor.execute(query2)
            connection.commit()

        elif charge[1] == 5:
            charge1 = (charge[0], charge[1], str(charge[2]), typeofservice1[4][0], random.randint(20, 70))
            query2 = "INSERT INTO charge_of_service VALUES {};".format(charge1)
            cursor.execute(query2)
            connection.commit()

        elif charge[1] == 6:
            charge1 = (charge[0], charge[1], str(charge[2]), typeofservice1[5][0], random.randint(10, 40))
            query2 = "INSERT INTO charge_of_service VALUES {};".format(charge1)
            cursor.execute(query2)
            connection.commit()

        elif charge[1] == 7:
            charge1 = (charge[0], charge[1], str(charge[2]), typeofservice1[6][0], 0)
            query2 = "INSERT INTO charge_of_service VALUES {};".format(charge1)
            cursor.execute(query2)
            connection.commit()

    if connection.is_connected():
        cursor.close()
        connection.close()
        print("done")

except mysql.connector.Error as err:
    print("Something went wrong: {}".format(err))
