from flask import Flask, json, request, jsonify
from flask_cors import CORS 
import mysql.connector 
from fields import tuples_to_object, intersect_tables
import queries 

def close_query(connection, cursor):
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("done")

def execute_query(connection, query, cursor, map): 
    cursor.execute(query) 
    result = cursor.fetchall()
    print(result)
    # close_query(connection, cursor)

    return tuples_to_object(result, map)
try: 
    
    connection = mysql.connector.connect(
        host='localhost',
        database='databases2021',
        user='root',
        password='password'
    )

    cursor = connection.cursor()  

except mysql.connector.Error as err:
    print("Something went wrong: {}".format(err))

app = Flask(__name__)
CORS(app)


@app.route('/track-visits', methods=['GET'])
def getTrackVisits():
    date = None
    service = None
    operator = None
    cost = None
    req = request.args.get('params').split(', ') 
    for arg in req:
        splited = arg.split(': ')
        if splited[0] == 'date':
            if splited[1] != 'null':
                date = splited[1]

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
    fields = ['firstName', 'lastName', 'service', 'arrivalDate', 'departureDate']
    trackVisits = []

    if date != None: 
        temp = execute_query(connection, queries.getTrackVisitsDate(date), cursor, fields)
        if not trackVisits:
            trackVisits = temp
        else:
            trackVisits = intersect_tables(trackVisits, temp)

    if service != None: 
        temp = execute_query(connection, queries.getTrackVisitsService(service), cursor, fields) 
        if not trackVisits:
            trackVisits = temp
        else:
            trackVisits = intersect_tables(trackVisits, temp) 

    if cost != None:
        temp = execute_query(connection, queries.getTrackVisitsCost(operator, cost), cursor, fields)
        if not trackVisits:
            trackVisits = temp
        else:
            trackVisits = intersect_tables(trackVisits, temp)
 
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
    fields = ['service', 'sells'] 
    return jsonify(execute_query(connection, queries.getSellsPerService(), cursor, fields))


@app.route('/list-customer', methods=['GET'])
def getListCustomers():
    service = request.args.get('params')
    if service == ' ':  # None
        return jsonify([])
    fields = ['firstName', 'lastName', 'age', 'arrival', 'departure', 'email', 'phone']
    return jsonify(execute_query(connection, queries.getListsCustomersPerService(service), cursor, fields))


@app.route('/covid-service-list', methods=['GET'])
def getCovidServiceList():
    nfc_id = request.args.get('nfc_id')
    fields = ['service', 'arrivalDate', 'departureDate']
    return jsonify(execute_query(connection, queries.getCovidServiceListReport(nfc_id), cursor, fields))  

@app.route('/people-covid', methods=['GET'])
def getPeopleCovid():
    nfc_id = request.args.get('nfc_id')
    fields = ['firstName', 'lastName', 'service', 'arrivalDate', 'departureDate']
    return jsonify(execute_query(connection, queries.getCovidPossibleInfections(nfc_id), cursor, fields))  


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

    fields = ['service', 'sells']
    if age == "20":
        # return jsonify(sellsPer20)
        return jsonify(execute_query(connection, queries.getAgePlaces("20","40"),cursor, fields ))
    elif age == "41":
        # return jsonify(sellsPer41)
        return jsonify(execute_query(connection, queries.getAgePlaces("41","60"),cursor, fields ))
    elif age == "61":
        # return jsonify(sellsPer61)
        return jsonify(execute_query(connection, queries.getAgePlaces("61","150"),cursor, fields ))

    return "Error"

@app.route('/per-service-per-age/<age>', methods=['GET'])
def getSellsPerAgePerService(age):
    fields = ['service', 'sells'] 
    if age == "20":
        return jsonify(execute_query(connection, queries.getAgeServices("20","40"), cursor, fields))  

    elif age == "41": 
        return jsonify(execute_query(connection, queries.getAgeServices("41","60"), cursor, fields))  
    
    elif age == "61": 
        return jsonify(execute_query(connection, queries.getAgeServices("61","150"), cursor, fields))  

    return "Error"

@app.route('/popular-per-age/<age>', methods=['GET'])
def getPopular(age): 
    fields = ['service', 'sells'] 
    if age == "20":
        return jsonify(execute_query(connection, queries.getPopularServices("20","40"), cursor, fields))  

    elif age == "41": 
        return jsonify(execute_query(connection, queries.getPopularServices("41","60"), cursor, fields))  
    
    elif age == "61": 
        return jsonify(execute_query(connection, queries.getPopularServices("61","150"), cursor, fields))  

    return "Error"

@app.route('/profile-data', methods=['GET'])
def getProfileData():
    nfc_id = request.args.get('nfc_id')

    cursor.execute(queries.getProfileData(nfc_id))
    result = cursor.fetchall()
    print("Profile: ", result)
    data = {
        'firstName': result[0][0],
        'lastName': result[0][1],
        'email': result[0][2],
        'number': result[0][3],
    } 
    print("profile: ", data)
    return jsonify(data)


def executeUpdate(connection, cursor, query):
    cursor.execute(query)
    connection.commit()

@app.route('/profile-data', methods=['PUT'])
def updatePassword(): 
    data = request.get_json()
    nfc_id = data['nfc_id']
    password = data['password']
    executeUpdate(connection, cursor, queries.updatePassword(nfc_id, password)) 
    print("commit executed")  
    return jsonify("success")


@app.route('/users/authenticate', methods=['GET'])
def authenticate():
    username = request.args.get('username')
    password = request.args.get('password')
    
    splited = username.split(' ')
 
    if len(splited) == 2:
        first = splited[0]
        last = splited[1]
    else: 
        raise Exception("not firstName space lastName")
 
    cursor.execute(queries.getLoginData(first,last,password)) 
    result = cursor.fetchall()
     
    if result == []:
        raise Exception("empty result")

    user = {
        'nfc_id': result[0][0],
        'username': username,
        'password': password,
        'firstName': first,
        'lastName': last
    } 
    return jsonify(user)

@app.errorhandler(Exception)
def exception_handler(error):
    return "!!!!"  + repr(error)

if __name__ == "__main__":
    app.run(debug=True)