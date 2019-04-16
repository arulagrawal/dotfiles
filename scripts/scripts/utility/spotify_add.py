#!/usr/bin/python3
import requests, base64, json

song_api_point = "https://api.spotify.com/v1/me/player"
save_api_point = "https://api.spotify.com/v1/me/tracks"
token_api_point = "https://accounts.spotify.com/api/token"

r_token = "AQAaRU8PsLDTWQnIRvGbwf_Tx4P_gLyJjW73Z9k0AffdDjlN_72jAdlQa402Sxnv4d2wFfgKefXPOa76qw8NoEQqZh8BpvMKbF2H0ieEFVqLZi_2Y_0lB1CYI9zRIMs_XoTNKw"

def getClientString():
    c_id = "1b4882f18b5844c18f2b50790dde0bc1"
    c_secret = "f3c13ff95c604199b2139cc165b5f73a"
    c_64 = c_id + ":" + c_secret
    c_64 = base64.b64encode(c_64.encode())
    c_64 = str(c_64)
    c_64 = c_64[2:-1]
    return c_64

def getToken(client_string):
    header = {'Authorization': 'Basic ' + client_string}
    payload = {'grant_type': 'refresh_token', 'refresh_token': r_token}
    p = requests.post(token_api_point, headers=header, data=payload)
    #print(p)
    token_json = json.loads(p.text)
    my_token = str(token_json['access_token'])
    return my_token

def getCurrentSong(my_token):
    payload = {'market': 'ZA'}
    headers = {'Authorization': 'Bearer ' + my_token}
    r = requests.get(song_api_point, params=payload, headers=headers)
    song = r.json()
    return song

def addCurrentSongToLibrary(song, my_token):
    song = song['item']['uri']
    song_id = song[14:]
    payload = {'ids': song_id}
    headers = {'Authorization': 'Bearer ' + my_token}
    p = requests.put(save_api_point, params=payload, headers=headers)

def main():
    client = getClientString()
    token = getToken(client)
    song = getCurrentSong(token)
    addCurrentSongToLibrary(song, token)

if __name__ == "__main__":
    main()