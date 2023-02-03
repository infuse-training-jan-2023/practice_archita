from src.item_repository import ItemRepository

items = [
    (3, 'Complete python exercises', 1),
    (4, 'Complete ruby exercises', 0),
    (5, 'Complete selenium exercises', 0)
]

item_repo = ItemRepository()

def test_get_all_items_makes_db_call(mocker):
    mock = mocker.patch('src.item_repository.ItemRepository.get_all_items', return_value = [])
    