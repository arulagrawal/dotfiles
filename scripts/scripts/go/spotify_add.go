package main

import (
	"bytes"
	"encoding/base64"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
	"os"
)

type client struct {
	ClientID     string `json:"c_id"`
	ClientSecret string `json:"c_secret"`
	RefreshToken string `json:"r_token"`
}

type spotify struct {
	accessToken   string
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

func (s *spotify) GetNewToken() {
	tokenAPI := "https://accounts.spotify.com/api/token"
	payload := []byte(`{"grant_type": "refresh_token", "refresh_token": s.client.RefreshToken}`)
	client := &http.Client{}
	req, err := http.NewRequest("POST", tokenAPI, bytes.NewBuffer(payload))
	if err != nil {

	}
	auth := "Basic " + s.encodedClient
	req.Header.Set("Authorization", auth)
	res, err := client.Do(req)
	// fmt.Println(req)
	if err != nil {
		fmt.Println("error is:", err)
	}
	defer res.Body.Close()

	fmt.Println(res)
}

func main() {
	spotifyClient := spotify{}
	spotifyClient.GetClient()
	// fmt.Println(spotifyClient)
	spotifyClient.EncodeClient()
	spotifyClient.GetNewToken()
}
