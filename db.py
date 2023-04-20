import pymysql

# connect to the database
db = pymysql.connect(
  host="localhost",
  user="root",
  password="123!@#asd",
  database="project",
  charset='utf8mb4',
  cursorclass=pymysql.cursors.DictCursor,
  autocommit=True
)