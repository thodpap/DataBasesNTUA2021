import mysql.connector
import random
import numpy as np

try:
    connection = mysql.connector.connect(
        host='localhost',
        database='databases2021',
        user='root',
        password='DB2021'
    )
    arrival_date_time = "SELECT arrival, departure FROM customers"
    cursor = connection.cursor()
    cursor.execute(arrival_date_time)
    enroll_date_time = cursor.fetchall()
    query_enroll_in_format = ("INSERT INTO enroll_in "
                              "values {};")

    enrolled_services = [4, 5, 6]

    for i in range(len(enroll_date_time)):
        probab = random.randint(0, 2)
        if probab == 1:
            # enrolled_service_ID = random.randint(4, 6)
            enrolled_service_ID = np.random.choice(enrolled_services, size=random.randint(0, 3), replace=False)
            for j in range(len(enrolled_service_ID)):
                data = (i, enrolled_service_ID[j], str(enroll_date_time[i][0]), str(enroll_date_time[i][1]))
                cursor.execute(query_enroll_in_format.format(data))
                connection.commit()
        else:
            continue
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("done")

except mysql.connector.Error as err:
    print("Something went wrong: {}".format(err))
