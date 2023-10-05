from flask import Flask, request
from flask_mysqldb import MySQL
from dotenv import load_env
import os

app = Flask(__name__)

app.config['MYSQL_USER'] = os.getenv('DBUSER')
app.config['MYSQL_DATABASE'] = os.getenv('DBNAME')
app.config['MYSQL_HOST'] = os.getenv('DBHOST')
app.config['MYSQL_PASSWORD'] = os.getenv('DBPASS')

mysql = MySQL(app)

@app.route('/')
def hello_world():  # put application's code here
    cursor = mysql.connection.cursor()
    
    #Executing SQL Statements
    cursor.execute(''' Select * From table ''')
    account = cursor.fetchone()
    #Saving the Actions performed on the DB
    mysql.connection.commit()
    
    #Closing the cursor
    cursor.close()

    return str(account['id'])


# # @app.route('/2')
@app.route('/add/<first>/<second>', methods=['GET'])
def func(first, second):  # put application's code here
    sum = int(first) + int(second)
    return str(sum)

@app.route('/subtract/<first>/<second>', methods=['GET'])
def subtract_route(first, second):  # put application's code here
    return int(first) - int(second)


if __name__ == '__main__':
    app.run()
