#!/bin/bash

# Set your API key and city ID
API_KEY="cf3ad0792da69504472f37c24848ac1b"
CITY_ID="4414001"

# Make the API request to OpenWeather
response=$(curl -s "https://api.openweathermap.org/data/2.5/weather?id=${CITY_ID}&appid=${API_KEY}")

# Parse the sky condition from the JSON response and capitalize it
sky_condition=$(echo $response | jq -r '.weather[0].description' | awk '{print toupper($0)}')

# Output the capitalized sky condition
echo "$sky_condition"

