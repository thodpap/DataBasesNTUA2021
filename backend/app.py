from flask import Flask, request, jsonify 
from flask_cors import CORS

app = Flask(__name__) 
CORS(app)

trackVisits = [
	{
		'service': 'Gym',
		'date': '2018-06-05',
		'firstName': 'Thodoris',
		'lastName': 'Paparrigopoulos',
		'age': 20
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

	# basicQ = oli i vasi
	# if date != None:
	# 	basicQ = query(basiQ)
	# if service != None:
	# 	basicQ = query new (basicQ)
	# if operator != 'null' and cost != None:
	# 	basicQ ....

	# for each basicQ :
	# 	 trackVisits.append(..)

	# query   

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
		'age': 20
	},
	{
		'firstName': 'Orfeas',
		'lastName': 'Filippopoulos',
		'age': 20
	}, 
]
@app.route('/list-customer', methods=['GET'])
def getListCustomers(): 
	service = request.args.get('params')
	if service == ' ': # None 
		return jsonify([])
	 
	return jsonify(listCustomers)	

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

covidServiceList = [
	{ 'service': 'Spa', 'date': '2021-06-05 03:55 04:23'}, # location date enter date enter time and exit time
	{ 'service': 'Gym', 'date': '2021-06-05 15:55 16:55'},  
]
@app.route('/covid-service-list', methods=['GET'])
def getCovidServiceList():
	return jsonify(covidServiceList)

if __name__ == "__main__":
	app.run(debug=True)