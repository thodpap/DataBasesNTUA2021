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

    for i in range(1, 10):
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
        data = (i, first_name, last_name, random_date, i + random.randint(0, 101), "ID card", "null")

        cursor.execute(query_customers_format.format(data))
        connection.commit()

        phone = ""
        for j in range(10):
            phone = phone + str(random.randint(0, 11))


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
