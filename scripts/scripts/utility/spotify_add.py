#!/usr/bin/python3
import base64
import json
import os
import sys

import requests

song_api_point = "https://api.spotify.com/v1/me/player"
save_api_point = "https://api.spotify.com/v1/me/tracks"
token_api_point = "https://accounts.spotify.com/api/token"


class Spotify:

    def loadDataFromFile(self):
        path = os.path.join(sys.path[0] + '/spotifyinfo.json')
        with open(path) as json_file:
            info_json = json.load(json_file)
            self.c_id = info_json['c_id']
            self.c_secret = info_json['c_secret']
            self.r_token = info_json['r_token']

    def getClientString(self):
        c_64 = self.c_id + ":" + self.c_secret
        c_64 = base64.b64encode(c_64.encode())
        c_64 = str(c_64)
        c_64 = c_64[2:-1]
        self.client_string = c_64

    def getToken(self):
        headers = {'Authorization': 'Basic ' + self.client_string}
        payload = {'grant_type': 'refresh_token',
                   'refresh_token': self.r_token}
        p = requests.post(token_api_point, headers=headers, data=payload)
        token_json = json.loads(p.text)
        self.my_token = str(token_json['access_token'])

    def getCurrentSong(self):
        params = {'market': 'ZA'}
        headers = {'Authorization': 'Bearer ' + self.my_token}
        self.song = requests.get(song_api_point, params=params,
                                 headers=headers).json()

    def addCurrentSongToLibrary(self):
        self.getCurrentSong()
        song = self.song['item']['uri']
        song_id = song[14:]
        params = {'ids': song_id}
        headers = {'Authorization': 'Bearer ' + self.my_token}
        requests.put(save_api_point, params=params, headers=headers)

    def __init__(self):
        self.loadDataFromFile()
        self.getClientString()
        self.getToken()


def main():
    spotify = Spotify()
    spotify.addCurrentSongToLibrary()


if __name__ == "__main__":
    main()
