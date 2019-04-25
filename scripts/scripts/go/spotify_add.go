package main

import (
	"encoding/base64"
	"encoding/json"
	"io/ioutil"
	"net/http"
	"net/url"
	"os"
	"path/filepath"
	"time"
)

var c = &http.Client{
	Timeout: 5 * time.Second,
}

type song struct {
	Item item `json:"item"`
}

type item struct {
	Title string `json:"name"`
	URI   string `json:"uri"`
}

type authToken struct {
	AccessToken string `json:"access_token"`
}

type client struct {
	ClientID     string `json:"c_id"`
	ClientSecret string `json:"c_secret"`
	RefreshToken string `json:"r_token"`
}

type spotify struct {
	accessToken   authToken
	client        client
	encodedClient string
	currentSong   song
}

func (s *spotify) GetClient() error {
	dir, err := filepath.Abs(filepath.Dir(os.Args[0]))
	if err != nil {
		return err
	}
	file := dir + "/spotifyinfo.json"
	jsonFile, err := os.Open(file)
	if err != nil {
		return err
	}
	byteValue, _ := ioutil.ReadAll(jsonFile)
	json.Unmarshal(byteValue, &s.client)
	// fmt.Println(s.client)
	return nil
}

func (s *spotify) EncodeClient() {
	myClient := s.client
	// fmt.Println(myClient)
	encode := myClient.ClientID + ":" + myClient.ClientSecret
	s.encodedClient = base64.StdEncoding.EncodeToString([]byte(encode))
	// fmt.Println(s.encodedClient)
}

func (s *spotify) GetNewToken() error {
	tokenAPI := "https://accounts.spotify.com/api/token"
	auth := url.Values{}
	auth.Set("grant_type", "refresh_token")
	auth.Set("refresh_token", s.client.RefreshToken)
	url := tokenAPI + "?" + auth.Encode()
	//fmt.Println(url)
	request, err := http.NewRequest(
		"POST",
		url,
		nil,
	)
	if err != nil {
		return err
	}
	authH := "Basic " + s.encodedClient
	request.Header.Set("Authorization", authH)
	request.Header.Set("content-type", "application/x-www-form-urlencoded")
	response, err := c.Do(request)
	if err != nil {
		return err
	}
	defer response.Body.Close()

	body, err := ioutil.ReadAll(response.Body)
	if err != nil {
		return err
	}
	var token authToken
	if err := json.Unmarshal(body, &token); err != nil {
		return err
	}
	s.accessToken = token
	return nil
}

func (s *spotify) GetCurrentSong() error {
	songAPI := "https://api.spotify.com/v1/me/player"
	request, err := http.NewRequest(
		"GET",
		songAPI,
		nil,
	)
	if err != nil {
		return err
	}
	request.Header.Set("Authorization", "Bearer "+s.accessToken.AccessToken)
	request.Header.Set("content-type", "application/x-www-form-urlencoded")
	response, err := c.Do(request)
	if err != nil {
		return err
	}
	defer response.Body.Close()
	body, err := ioutil.ReadAll(response.Body)
	if err != nil {
		return err
	}
	//fmt.Println(string(body))
	var currentSong song
	if err := json.Unmarshal(body, &currentSong); err != nil {
		return err
	}
	s.currentSong = currentSong
	//fmt.Println(currentSong)
	return nil
}

func (s *spotify) AddCurrentSongToLibrary() error {
	saveAPI := "https://api.spotify.com/v1/me/tracks"
	s.GetCurrentSong()
	currentSongID := s.currentSong.Item.URI[14:]
	auth := url.Values{}
	auth.Set("ids", currentSongID)
	url := saveAPI + "?" + auth.Encode()
	request, err := http.NewRequest(
		"PUT",
		url,
		nil,
	)
	if err != nil {
		return err
	}
	request.Header.Set("Authorization", "Bearer "+s.accessToken.AccessToken)
	request.Header.Set("content-type", "application/json")

	response, err := c.Do(request)
	if err != nil {
		return err
	}
	defer response.Body.Close()
	//fmt.Println(string(body))

	return nil
}

func main() {
	spotifyClient := spotify{}
	err := spotifyClient.GetClient()
	if err != nil {
		panic(err)
	}
	// fmt.Println(spotifyClient)
	spotifyClient.EncodeClient()
	err = spotifyClient.GetNewToken()
	if err != nil {
		panic(err)
	}

	err = spotifyClient.AddCurrentSongToLibrary()
	if err != nil {
		panic(err)
	}

}
