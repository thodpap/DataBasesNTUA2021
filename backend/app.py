from flask import Flask, request, jsonify
from flask_cors import CORS 
import mysql.connector 
from fields import tuples_to_object 

def close_query(connection, cursor):
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("done")

def execute_query(connection, query, cursor):
    cursor.execute(query)
    result = cursor.fetchall()
    close_query(connection, cursor)

    return result
try:
    connection = mysql.connector.connect(
        host='localhost',
        database='databases2021',
        user='root',
        password='password'
    )

    cursor = connection.cursor()  
    
    # test
    # print(tuples_to_object(execute_query(connection, "SELECT * from customers;", cursor), 
    #     ["nfc_id", "firstName", "lastName", "birth", "doc_num", "doc_type", "IssuingAuthority", "password", "arrivalDate","departureDate","age"]))
except mysql.connector.Error as err:
    print("Something went wrong: {}".format(err))

app = Flask(__name__)
CORS(app)

trackVisits = [
    {
        'service': 'Gym',
        'firstName': 'Thodoris',
        'lastName': 'Paparrigopoulos',
        'arrivalDate': '03:55',
        'departureDate': '05:59',
        'date': '2018-06-05',
    }
] 
@app.route('/track-visits', methods=['GET'])
def getTrackVisits():
    date = None
    service = None
    operator = None
    cost = None

    for arg in request.args.get('params').split(', '):
        splited = arg.split(': ')
        if splited[0] == 'date':
            if splited[1] != 'null':
                service = splited[1]
        elif splited[0] == 'service':
            if splited[1] != 'null':
                service = splited[1]
        elif splited[0] == 'operator':
            operator = splited[1]
        elif splited[0] == 'cost':
            if splited[1] != 'null':
                cost = int(splited[1])
    if operator == 'null' and cost != None:
        cost = None 

    return jsonify(trackVisits)


sellsPerVisit = [
    {'service': "Pool", 'sells': 300},
    {'service': "Room", 'sells': 500},
    {'service': "Sauna", 'sells': 50},
    {'service': "Tennis", 'sells': 600},
    {'service': "Video Games", 'sells': 80},
]


@app.route('/sells-per-service', methods=['GET'])
def getSellsPerVisit():
    return jsonify(sellsPerVisit)


listCustomers = [
    {
        'firstName': 'Thodoris',
        'lastName': 'Paparrigopoulos',
        'age': '2018-05-05',
        'email': 'paparrigopoulosthodoris@gmail.com',
        'phone': '6971670732'
    },
    {
        'firstName': 'Thodoris',
        'lastName': 'Paparrigopoulos',
        'age': '2018-05-05',
        'email': 'paparrigopoulosthodoris@gmail.com',
        'phone': '6971670732'
    },
] 
@app.route('/list-customer', methods=['GET'])
def getListCustomers():
    service = request.args.get('params')
    if service == ' ':  # None
        return jsonify([])

    return jsonify(listCustomers)


covidServiceList = [
    {'service': 'Spa', 'arrivalDate': '2021-06-05 03:55', 'departureDate': '2021-06-05 04:23'},  
    {'service': 'Spa', 'arrivalDate': '2021-06-05 03:55', 'departureDate': '2021-06-05 04:23'},  
] 
@app.route('/covid-service-list', methods=['GET'])
def getCovidServiceList():
    nfc_id = request.args.get('nfc_id')
    return jsonify(covidServiceList)


covidPeople = [
    {
        'firstName': 'Thodoris',
        'lastName': 'Paparrigopoulos',
        'service': 'Spa',
        'arrivalDate': '2021-06-05 03:55', 
        'departureDate': '2021-06-05 04:23'
    },
] 
@app.route('/people-covid', methods=['GET'])
def getPeopleCovid():
    nfc_id = request.args.get('nfc_id')
    return jsonify(covidPeople)


sellsPer20 = [
    {'service': "Pool", 'sells': 100},
    {'service': "Room", 'sells': 100},
    {'service': "Sauna", 'sells': 20},
    {'service': "Tennis", 'sells': 30},
    {'service': "Video Games", 'sells': 5},
]
sellsPer41 = [
    {'service': "Pool", 'sells': 50},
    {'service': "Room", 'sells': 300},
    {'service': "Sauna", 'sells': 320},
    {'service': "Tennis", 'sells': 130},
    {'service': "Video Games", 'sells': 135},
]
sellsPer61 = [
    {'service': "Pool", 'sells': 50},
    {'service': "Room", 'sells': 100},
    {'service': "Sauna", 'sells': 500},
    {'service': "Tennis", 'sells': 0},
    {'service': "Video Games", 'sells': 0},
]


@app.route('/sells-per-age/<age>', methods=['GET'])
def getSellsPerAge(age):
    if age == "20":
        return jsonify(sellsPer20)
    elif age == "41":
        return jsonify(sellsPer41)
    elif age == "61":
        return jsonify(sellsPer61)

    return "Error"


@app.route('/profile-data', methods=['GET'])
def getProfileData():
    nfc_id = request.args.get('nfc_id')
    data = {
        'firstName': 'Thodoris',
        'lastName': 'Paparrigopoulos',
        'email': 'paparrigopoulosthodoris@gmail.com',
        'number': '6971670732'
    }
    return jsonify(data)


@app.route('/profile-data', methods=['PUT'])
def updatePassword():
    data = request.get_json()
    nfc_id = data['nfc_id']
    password = data['password']
    return jsonify("success")


@app.route('/users/authenticate', methods=['GET'])
def authenticate():
    username = request.args.get('username')
    password = request.args.get('password')
    print(username, password)
    user = {
        'nfc_id': '10',
        'username': username,
        'password': password,
        'firstName': 'Thodoris',
        'lastName': 'Paparrigopoulos'
    }

    return jsonify(user)
if __name__ == "__main__":
    app.run(debug=True)
