#!/bin/bash
correctas=0
incorrectas=0

hacer_pregunta(){
pregunta="$1"
respuesta_correcta="$2"

echo "$pregunta"
echo -n "|  Tu respuesta: "
tput sc
tput cuf 52
echo -n "|"
tput rc
read -r respuesta_usuario

if [ "$respuesta_usuario" == "$respuesta_correcta" ]; then  
    echo "|  Correcto!                                                         |"
    ((correctas++))
else

    if [ "$respuesta_correcta" == "Linux" ]; then
        echo "|  Incorrecto, La respuesta correcta era $respuesta_correcta                       |"
    elif [ "$respuesta_correcta" == "Einstein" ]; then
        echo "|  Incorrecto, La respuesta correcta era $respuesta_correcta                    |"
    elif [ "$respuesta_correcta" == "Leonardo da Vinci" ]; then
        echo "|  Incorrecto, La respuesta correcta era $respuesta_correcta           |"
    elif [ "$respuesta_correcta" == "1969" ]; then
        echo "|  Incorrecto, La respuesta correcta era $respuesta_correcta                        |"
    elif [ "$respuesta_correcta" == "6" ]; then
        echo "|  Incorrecto, La respuesta correcta era $respuesta_correcta                           |"
    else
 	echo "error"
    fi

    ((incorrectas++))
fi

echo -e "+--------------------------------------------------------------------+\n"
}

echo "+--------------------------------------------------------------------+"
echo "|  Bienvenido al Cuestionario: Responde a las siguientes preguntas:  |"
echo "|  Recuerda que las respuestas deben ir la primera con Mayúsculas    |"
echo "+--------------------------------------------------------------------+"

echo "+--------------------------------------------------------------------+"
hacer_pregunta "|  ¿Que SO usa Debian?                                               |" "Linux"
echo "+--------------------------------------------------------------------+"
hacer_pregunta "|  ¿Quién descubrió la teoría de la relatividad?                     |" "Einstein"
echo "+--------------------------------------------------------------------+"
hacer_pregunta "|  ¿Quién pintó la Mona Lisa?                                        |" "Leonardo da Vinci"
echo "+--------------------------------------------------------------------+"
hacer_pregunta "|  ¿Cúando se llegó a la Luna?                                       |" "1969"
echo "+--------------------------------------------------------------------+"
hacer_pregunta "|  ¿Cuántos continentes hay en el mundo?                             |" "6"

echo -e "==================== Resultados del cuestionario ====================\n"
echo "                       Respuestas correctas: $correctas"
echo "                      Respuestas incorrectas: $incorrectas"

total=$((correctas+incorrectas))
porcentaje=$(((correctas*100)/total))

echo "                     Puntuación total es de: $porcentaje %"

if [ $porcentaje -ge 80 ]; then
 echo "                          ¡Excelente trabajo!"
elif [ $porcentaje -ge 50 ]; then
 echo "                  Buen trabajo, pero se puede mejorar"
else 
 echo "                    Te falta cultura, lee un libro"
fi
