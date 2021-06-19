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
			date = splited[1] 
		elif splited[0] == 'service':
			if splited[1] != 'null':
				pass 
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
	
if __name__ == "__main__":
	app.run(debug=True)