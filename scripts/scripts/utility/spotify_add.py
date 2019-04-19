#!/usr/bin/python3
import requests, base64, json

song_api_point = "https://api.spotify.com/v1/me/player"
save_api_point = "https://api.spotify.com/v1/me/tracks"
token_api_point = "https://accounts.spotify.com/api/token"

r_token = "AQCHZ9aZBMqOyd2g-ArboVmOf1xQz-49pb5TyWDMMsLQK6VD7GZeiZkM55pUglmXx9BE7Mi7PfnwXaZO66r3I25L-aMBMgb9JFrx_qOc1lA4ciuYBa7-Lhy6M4n9NCIutVFZaA"


def getClientString():
    c_id = "1b4882f18b5844c18f2b50790dde0bc1"
    c_secret = "f3c13ff95c604199b2139cc165b5f73a"
    c_64 = c_id + ":" + c_secret
    c_64 = base64.b64encode(c_64.encode())
    c_64 = str(c_64)
    c_64 = c_64[2:-1]
    return c_64


def getToken(client_string):
    headers = {'Authorization': 'Basic ' + client_string}
    payload = {'grant_type': 'refresh_token', 'refresh_token': r_token}
    p = requests.post(token_api_point, headers=headers, data=payload)
    token_json = json.loads(p.text)
    my_token = str(token_json['access_token'])
    return my_token


def getCurrentSong(my_token):
    params = {'market': 'ZA'}
    headers = {'Authorization': 'Bearer ' + my_token}
    r = requests.get(song_api_point, params=params, headers=headers)
    return r.json()


def addCurrentSongToLibrary(song, my_token):
    song = song['item']['uri']
    song_id = song[14:]
    params = {'ids': song_id}
    headers = {'Authorization': 'Bearer ' + my_token}
    requests.put(save_api_point, params=params, headers=headers)


def main():
    client = getClientString()
    token = getToken(client)
    song = getCurrentSong(token)
    addCurrentSongToLibrary(song, token)


if __name__ == "__main__":
    main()
