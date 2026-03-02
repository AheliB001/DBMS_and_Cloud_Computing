import mysql.connector

cnx = mysql.connector.connect(
    host="localhost",
    user="root",
    password="mypassword",
    database="library"
)

cur = cnx.cursor()

#Function to show all students
def show_students():
    cur.execute("SELECT StudentName FROM Students;")
    students = cur.fetchall()

    print("All Students:")
    for s in students:
        print(s[0])


# Function to show defaulters
def show_defaulters():
    query = """
    SELECT s.StudentName
    FROM Book_Issues bi
    JOIN Students s ON bi.StudentID = s.StudentID
    WHERE bi.ReturnedBook = 0;
    """
    cur.execute(query)
    defaulters = cur.fetchall()

    print("\nDefaulters:")
    for d in defaulters:
        print(d[0])

show_students()
show_defaulters()

cur.close()
cnx.close()
