# Generar un número aleatorio entre 1 y 100
numero_secreto=$(( RANDOM % 100 + 1 ))

echo "¡Bienvenido al juego de Adivina el Número!"
echo "=========================================="

intentos=0
adivinado=false

while ! $adivinado; do
    read -p "Introduce tu número (entre 1 y 100): " intento

    #Le pide al usuario ingresar un numero valido
    if ! [[ "$intento" =~ ^[0-9]+$ ]]; then
        echo "Por favor, introduce un número válido."
        continue
    fi

    # Aumenta el  contador de intentos
    (( intentos++ ))

    # Compara el numero ingresado por el usuario con el generado aleatoriamente
    if (( intento < numero_secreto )); then
        echo "El número es demasiado bajo. Inténtalo de nuevo."
    elif (( intento > numero_secreto )); then
        echo "El número es demasiado alto. Inténtalo de nuevo."
    else
        echo "¡Felicidades! ¡Has adivinado el número secreto $numero_secreto en $intentos intentos!"
        adivinado=true
    fi
done

