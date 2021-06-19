import mysql.connector
import random
import numpy as np


def check_if_inside(list, el1, el2):
    game = False
    game1 = el1.split(":")
    game2 = el2.split(":")
    for p in range(len(list)):
        temporary = list[p][0].split(":")
        temporary1 = list[p][1].split(":")
        if (int(temporary[0]) <= int(game1[0]) <= int(temporary1[0])) or (
                int(temporary[0]) <= int(game2[0]) <= int(temporary1[0])):
            game = True
            break

    return game


def find_one(NFC, list):
    for k in range(len(list)):
        if list[k][0] == NFC:
            return ((str(list[k][2]).split(' '))[0]).split('-'), ((str(list[k][3]).split(' '))[0]).split('-')


def find_places(NFC, table):
    temp = []
    for k in range(len(table)):
        if table[k][0] == NFC:
            temp.append(table[k][1])

    return temp


try:
    connection = mysql.connector.connect(
        host='localhost',
        database='databases2021',
        user='root',
        password='DB2021'
    )

    sql_select_access = "SELECT * FROM access"
    cursor = connection.cursor()
    cursor.execute(sql_select_access)
    results = cursor.fetchall()
    query_visits_format = ("INSERT INTO visits "
                           "values {};")

    NFCs = list(set([res[0] for res in results]))
    print(NFCs)

    for i in range(len(NFCs)):
        open_date, closed_date = find_one(NFCs[i], results)
        places = list(set(find_places(NFCs[i], results)))

        if int(open_date[1]) == int(closed_date[1]):
            days = int(closed_date[2]) - int(open_date[2]) + 1
            for j in range(1, days):
                NFC_ID = []
                for k in range(5):
                    random.shuffle(places)
                    for place in places:
                        timer = random.randint(0, 21)
                        time = str(timer) + ":" + str(random.randint(0, 59)) + ":" + str(0) + str(0)
                        time1 = str(timer + random.randint(1, 2)) + ":" + str(
                            random.randint(0, 59)) + ":" + str(0) + str(0)

                        boolean = check_if_inside(NFC_ID, time, time1)

                        if not boolean:
                            NFC_ID.append((time, time1))

                            day = int(open_date[2]) + j

                            data = (
                                NFCs[i], place,
                                str(open_date[0]) + '-' + str(open_date[1]) + '-' + str(day) + " " + time,
                                str(open_date[0]) + '-' + str(
                                    open_date[1]) + '-' + str(day) + " " + time1)
                            cursor.execute(query_visits_format.format(data))
                            connection.commit()

        else:
            if int(open_date[1]) == 4 or int(open_date[1]) == 6 or int(open_date[1]) == 9 or int(open_date[1]) == 11:
                delta = 30

            elif int(open_date[1]) == 2:
                delta = 28

            else:
                delta = 31

            x = delta - int(open_date[2]) + 1
            y = int(closed_date[2])
            days1 = x + y

            day = int(open_date[2])
            for j in range(1, days1):
                NFC_ID = []
                for k in range(5):
                    for place in places:
                        timer = random.randint(0, 21)
                        time2 = str(timer) + ":" + str(random.randint(0, 59)) + ":" + str(0) + str(0)
                        time3 = str(timer + random.randint(1, 2)) + ":" + str(
                            random.randint(0, 59)) + ":" + str(0) + str(0)

                        boolean = check_if_inside(NFC_ID, time2, time3)

                        if not boolean:
                            NFC_ID.append((time2, time3))
                            day = (day + 1) % delta

                            if day == 0:
                                day = 1
                                open_date[1] = closed_date[1]

                            data = (
                                NFCs[i], place,
                                str(open_date[0]) + '-' + str(open_date[1]) + '-' + str(day) + " " + time2,
                                str(open_date[0]) + '-' + str(
                                    open_date[1]) + '-' + str(day) + " " + time3)
                            cursor.execute(query_visits_format.format(data))
                            connection.commit()

    if connection.is_connected():
        cursor.close()
        connection.close()
        print("done")
except mysql.connector.Error as err:
    print("Something went wrong: {}".format(err))
