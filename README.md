# DataBasesNTUA2021

Steps to install all dependancies

Frontend

1) install node.js: sudo apt install nodejs
2) install npm: npm install -g npm
3) install angular: sudo npm install -g @angular/cli

Για να τρέξετε το frontend χρειάζεται:
cd frontend/
ng serve

Ωστόσο μερικές φορές υπάρχει ένα θέμα συμβατότητας μεταξύ της angular και της version του npm. Εμείς χρησιμοποιήσαμε:
angular: 11.2.13
node -v: v12.22.1
npm -v: 7.11.1 

Backend
Η αλήθεια είναι ότι χρησιμοποιήσαμε pipenv αλλά δεν είμαστε σίγουροι με το αν θα σας δουλέψει έτσι οπότε θα αναφέρουμε αναλυτικά όλα τα βήματα και εδώ.

1) install pip3: sudo apt-get install python3-pip
2) install flask: pip3 install flask (ισως θελει sudo)
3) install flask_cors: pip3 install Flask-Cors (ισως θελει sudo)
4) install mysql.connector pip install mysql-connector-python

Στο δικό μας setup πρωτού ανοίξουμε το backend χρειάζεται να τρέξουμε 
mysql -u root -p
και έπειτα SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

Για να ανοίξουμε το backend χρειάζεται να κάνουμε
1) chmod +x bootstrap.sh
2) ./bootstrap.sh

