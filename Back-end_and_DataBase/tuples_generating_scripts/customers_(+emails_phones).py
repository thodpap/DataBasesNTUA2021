import mysql.connector
import names
import random
import datetime
import string

try:
    connection = mysql.connector.connect(
        host='localhost',
        database='databases2021',
        user='root',
        password='DB2021'
    )

    cursor = connection.cursor()

    query_customers_format = ("INSERT INTO customers "
                              "values {};")
    query_customers_emails_format = ("INSERT INTO customers_emails "
                                     "values {};")

    query_customers_phones_format = ("INSERT INTO customers_phones "
                                     "values {};")


    # start_date = datetime.datetime(1950, 1, 1)
    # end_date = datetime.datetime(2020, 1, 1)
    # time_between_dates = end_date - start_date
    # days_between_dates = time_between_dates.days

    for i in range(1, 50):
        # random_number_of_days = random.randrange(days_between_dates)
        # random_date = start_date + datetime.timedelta(days=random_number_of_days)
        random_year = random.randint(1950, 2021)
        random_month = random.randint(1, 13)
        random_day = random.randint(1, 31)
        random_date = str(random_year) + "-" + str(random_month) + "-" + str(random_day)
        first_name = names.get_first_name()
        print(first_name, end=" ")
        last_name = names.get_last_name()
        print(last_name)
        password = ""
        for p in range(random.randint(10, 20)):
            password = password + random.choice(string.ascii_letters)

        div_to = 30
        month_arr = random.randint(1, 12)
        day_arr = random.randint(1, 30)
        if month_arr == 2:
            day_arr = random.randint(1, 26)
            div_to = 28
        time_arr = str(random.randint(10, 23)) + ":" + str(random.randint(0, 59)) + ":" + str(0) + str(0)

        month_dep = month_arr
        day_dep = random.randint(1, 31) + day_arr
        if day_dep > 30:
            month_dep += 1
            month_dep = month_dep % 12
            day_dep = day_dep % div_to
        time_dep = str(random.randint(10, 23)) + ":" + str(random.randint(0, 59)) + ":" + str(0) + str(0)

        data = (i, first_name, last_name, random_date, i + random.randint(0, 101), "ID card", "null", password, '2021-' +
                str(month_arr) + '-' + str(day_arr) + " " + time_arr, '2021-' +
                str(month_dep) + '-' + str(day_dep) + " " + time_dep)

        cursor.execute(query_customers_format.format(data))
        connection.commit()

        pho = []
        pho.append(random.randint(6, 9))

        for b in range(1, 10):
            pho.append(random.randint(0, 9))

        phone = ""
        for k in pho:
            phone = phone + str(k)
        print(phone)

        email = first_name + last_name + "@gmail.com"

        data_phones = (i, phone)
        data_email = (i, email)

        cursor.execute(query_customers_phones_format.format(data_phones))
        connection.commit()
        cursor.execute(query_customers_emails_format.format(data_email))
        connection.commit()

    if connection.is_connected():
        cursor.close()
        connection.close()
        print("done")

except mysql.connector.Error as err:
    print("Something went wrong: {}".format(err))
