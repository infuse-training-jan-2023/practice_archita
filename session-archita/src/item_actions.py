from item_repository import ItemRepository

class ItemActions:
    def __init__(self) -> None:
        self.item_repo = ItemRepository()

    def get_all_items(self):
        try:
            items = self.item_repo.get_all_items()
            res = []
            for item in items:
                res.append({
                'id': item[0],
                'item': item[1],
                'status': item[2],
                'reminder': item[3],
                })
            return res
        except Exception as e:
            print(e)
            return {}

    def get_item(self, id):
        try:
            items = self.item_repo.get_item(id)
            res = []
            for item in items:
                res.append({
                'id': item[0],
                'item': item[1],
                'status': item[2],
                'reminder': item[3],
                })
            return res
        except Exception as e:
            print(e)
            return {}
    
    def add_item(self, item, reminder):
        try:
            item = self.item_repo.add_item(item, reminder)
            return item
        except Exception as e:
            print(e)
            return {}

    def delete_item(self, id):
        try:
            item = self.item_repo.delete_item(id)
            return item
        except Exception as e:
            print(e)
            return {}

    def update_item(self, id, item_dict):
        try:
            item = self.item_repo.update_item(id, item_dict)
            return item
        except Exception as e:
            print(e)
            return {}

    def register_user(self, user_name, email):
        try:
            user = self.item_repo.register_user(user_name, email)
            return user
        except Exception as e:
            print(e)
            return {}

    def save_items(self):
        try:
            record = self.item_repo.save_items()
            return record
        except Exception as e:
            print(e)
            return {}