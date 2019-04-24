package main

import (
	"encoding/base64"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
	"net/url"
	"os"
	"time"
)

var c = &http.Client{
	Timeout: 5 * time.Second,
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
	song          string
}

func (s *spotify) GetClient() {
	jsonFile, err := os.Open("spotifyinfo.json")
	if err != nil {
		fmt.Println(err)
	}
	byteValue, _ := ioutil.ReadAll(jsonFile)
	json.Unmarshal(byteValue, &s.client)
	// fmt.Println(s.client)
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

func main() {
	spotifyClient := spotify{}
	spotifyClient.GetClient()
	// fmt.Println(spotifyClient)
	spotifyClient.EncodeClient()
	err := spotifyClient.GetNewToken()
	if err != nil {
		fmt.Println()
		fmt.Println(err)
	}
}
