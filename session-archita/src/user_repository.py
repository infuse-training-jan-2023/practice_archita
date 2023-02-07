import sqlite3

class UserRepository:
    def __init__(self) -> None:
        self.DBPATH = "./todo.db"
        self.conn = None

    def connect_db(self):
        if self.conn is None:
            self.conn = sqlite3.connect(self.DBPATH, check_same_thread=False)

    def register_user(self, user_name, email):
        try:
            self.connect_db()
            c = self.conn.cursor()
            insert_cursor = c.execute("INSERT INTO users (user_name, email_id) VALUES (?,?)", 
            (user_name, email))
            self.conn.commit()
            return {
                'id': insert_cursor.lastrowid,
                'user name': user_name,
                'email': email
            }
        except Exception as e:
            raise Exception("Error: ", e)