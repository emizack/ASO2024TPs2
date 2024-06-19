#!/bin/bash

# Solicitar al usuario que ingrese la ciudad
echo "Ingrese el nombre de la ciudad:"
read CITY

API_KEY="a46933aca12941e390a204604241906"  

# URL de la API
URL="http://api.weatherapi.com/v1/current.json?key=${API_KEY}&q=${CITY}&aqi=no"

# Realizar la solicitud a la API y guardar la respuesta en una variable
response=$(curl -s "$URL")

# Verifica si hubo algun error
if [[ $? -ne 0 ]]; then
    echo "Error: Hubo un problema al intentar obtener el clima."
    exit 1
fi

# Parsear la respuesta para mostrar la información del clima actual
current_temp=$(echo "$response" | jq -r '.current.temp_c')
condition=$(echo "$response" | jq -r '.current.condition.text')

# Mostrar la información del clima
echo "Clima actual en ${CITY}:"
echo "Temperatura: ${current_temp}°C"

exit 0


