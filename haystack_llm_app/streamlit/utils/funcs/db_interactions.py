# Use requests to get the data from the database
import requests
import os
import logging
db_base_url = os.environ.get('DB_BASE_URL', 'http://127.0.0.1:5001')

def get_categories():
    #logging.info(f"DB BASE URL: {db_base_url}")
    response = requests.get(f'{db_base_url}/category')
    data = response.json()
    return data

def get_items(ids=None,categories=None):
    params = {
        'id': ids,
        'category': categories,
    }
    response = requests.get(f'{db_base_url}/item', params=params)
    data = response.json()
    return data

def purchase_item(id,quantity):

    headers = {
    'Content-type':'application/json', 
    'Accept':'application/json'
    }

    data = {
        'id': id,
        'quantity': quantity,
    }
    response = requests.post(f'{db_base_url}/item/purchase', json=data, headers=headers)
    print(response)
    print(response.text)
    response_json = response.json()
    return response_json