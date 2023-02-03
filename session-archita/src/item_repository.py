import sqlite3, csv

class ItemRepository:
    def __init__(self) -> None:
        self.DBPATH = "./todo.db"
        self.NOT_STARTED = "Not Started"
        self.conn = None

    def connect_db(self):
        if self.conn is None:
            self.conn = sqlite3.connect(self.DBPATH, check_same_thread=False)

    def get_all_items(self):
        try:
            self.connect_db()
            c = self.conn.cursor()
            rows = c.execute('select * from items')
            return rows
        except Exception as e:
            raise Exception("Error: ", e)

    def get_item(self, id):
        try:
            self.connect_db()
            c = self.conn.cursor()
            row = c.execute('select * from items where id=?', (id,))
            return row.fetchall()
        except Exception as e:
            raise Exception("Error: ", e)

    def add_item(self, item, reminder):
        try:
            self.connect_db()
            c = self.conn.cursor()
            insert_cursor = c.execute("INSERT INTO items (item, status, reminder) VALUES (?,?,?)", 
            (item, self.NOT_STARTED, reminder))
            self.conn.commit()
            return {
                'Message': f'Item {insert_cursor.lastrowid} is added successfully'
            }
        except Exception as e:
            raise Exception("Error: ", e)

    def delete_item(self, id):
        try:
            row = self.get_item(id)
            if len(row) == 0:
                return {
                    'Message': f'Item {id} does not exist'
                }

            self.connect_db()
            c = self.conn.cursor()
            c.execute('delete from items where id=?', (id,))
            self.conn.commit()
            return {
                'Message': f'Item {id} deleted successfully'
            }
        except Exception as e:
            raise Exception("Error: ", e)

    def update_item(self, id, item_dict):
        try:
            row = self.get_item(id)
            if len(row) == 0:
                return {
                    'Message': f'Item {id} does not exist'
                }

            self.connect_db()
            c = self.conn.cursor()
            for key in item_dict.keys():
                c.execute(f'update items set {key}=? where id=?', (item_dict[key], id,))
            self.conn.commit()
            return {
                'Message': f'Item {id} updated successfully'
            }
        except Exception as e:
            raise Exception("Error: ", e)

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

    def save_items(self):
        try:
            with open('items.csv', 'w', newline='') as csvfile:
                fields = ['ID', 'ITEM', 'STATUS', 'REMINDER']
                csvwriter = csv.writer(csvfile)
                csvwriter.writerow(fields)

                rows = self.get_all_items()
                csvwriter.writerows(rows)
            return {
                'Message': "Items saved successfully"
            }
        except Exception as e:
            raise Exception("Error: ", e)