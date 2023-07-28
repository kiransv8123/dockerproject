import requests


def test_get_user():
    response = requests.get("https://reqres.in/api/users?page=2")
    assert response.status_code == 200


def test_create_user():
    data = {
        "email": "eve.holt@reqres.in",
        "password": "pistol"
    }
    response = requests.post("https://reqres.in/api/register", json=data)
    assert response.status_code == 200
    assert response.json()["id"] == 4


# def test_example():
#     print("Running test_example inside the container!")
#