import pymysql

import configparser

# Create a configparser object
config = configparser.ConfigParser()
# Read the file
config.read('db_secrets.txt')

# Get a specific property
username = config.get('Database', 'username')
password = config.get('Database', 'password')

# connect to the database
db = pymysql.connect(
  host="localhost",
  user=username,
  password=password,
  database="project",
  charset='utf8mb4',
  cursorclass=pymysql.cursors.DictCursor,
  autocommit=True
)