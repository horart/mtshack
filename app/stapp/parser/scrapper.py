import requests

def get_page(url, add = {}):
	response = requests.get(url, add)
	if add == {}:
		return response.json()
	return response


def post_page(url, file):
	response = requests.post(url, files=file)
	return response.json()