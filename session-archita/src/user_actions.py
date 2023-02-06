from user_repository import UserRepository

class UserActions:
    def __init__(self) -> None:
        self.user_repo = UserRepository()

    def register_user(self, user_name, email):
        try:
            user = self.user_repo.register_user(user_name, email)
            return user
        except Exception as e:
            print(e)
            return {}

   