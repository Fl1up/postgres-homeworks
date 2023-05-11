import psycopg2, csv

conn = psycopg2.connect(host="localhost", database="north", user="postgres", password=None)

cursor = conn.cursor()

with open('north_data/employees_data.csv', 'r') as f:
    reader = csv.reader(f)
    next(reader)  # пропускаем заголовок
    for row in reader:
        cursor.execute("INSERT INTO employees VALUES (%s, %s, %s, %s, %s)", row)

with open('north_data/customers_data.csv', 'r') as f:
    reader = csv.reader(f)
    next(reader)
    for row in reader:
        cursor.execute("INSERT INTO customers  VALUES (%s, %s, %s)", row)

with open('north_data/orders_data.csv', 'r') as f:
    reader = csv.reader(f)
    next(reader)
    for row in reader:
        if row == "psycopg2.errors.UniqueViolation: ОШИБКА:":
            pass
        else:
            cursor.execute("INSERT INTO orders  VALUES (%s, %s, %s, %s, %s)", row)

conn.commit()
conn.close()







