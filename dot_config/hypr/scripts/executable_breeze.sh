#!/bin/bash

# Set your API key and city ID
API_KEY="cf3ad0792da69504472f37c24848ac1b"
CITY_ID="4414001"

# Make the API request to OpenWeather
response=$(curl -s "http://api.openweathermap.org/data/2.5/weather?id=${CITY_ID}&appid=${API_KEY}")

# Parse the humidity from the JSON response
humidity=$(echo $response | jq -r '.main.humidity')

# Output the humidity
echo "${humidity}%"
