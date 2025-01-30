#!/bin/bash
correctas=0
incorrectas=0

hacer_pregunta(){
pregunta="$1"
respuesta_correcta="$2"
echo "$pregunta"
read -p "Tu respuesta: " respuesta_usuario
if [ "$respuesta_usuario" == "$respuesta_correcta" ]; then
 echo -e "Correcto!\n"
 ((correctas++))
else
 echo -e "Incorrecto, La respuesta correcta era $respuesta_correcta\n"
 ((incorrectas++))
fi
}

echo "+--------------------------------------------------------------------+"
echo "|  Bienvenido al Cuestionario: Responde a las siguientes preguntas:  |"
echo "|  Recuerda que las respuestas deben ir la primera con Mayúsculas    |"
echo "+--------------------------------------------------------------------+"
echo
hacer_pregunta "¿Que SO usa Debian?" "Linux"
hacer_pregunta "¿Quién descubrió la teoría de la relatividad?" "Eistein"
hacer_pregunta "¿Quién pintó la Mona Lisa?" "Leonardo da Vinci"
hacer_pregunta "¿Cúando se llegó a la Luna?" "1969"
hacer_pregunta "¿Cuántos continentes hay en el mundo?" "6"
echo

echo "===== Resultados del cuestionario ====="
echo "Respuestas correctas: $correctas"
echo "Respuestas incorrectas: $incorrectas"

total=$((correctas+incorrectas))
porcentaje=$(((correctas*100)/total))

echo "Puntuación total es de: $porcentaje %"

if [ $porcentaje -ge 80 ]; then
 echo "¡Excelente trabajo!"
elif [ $porcentaje -ge 50 ]; then
 echo "Buen trabajo, pero se puede mejorar"
else 
 echo "Te falta cultura, lee un libro"
fi