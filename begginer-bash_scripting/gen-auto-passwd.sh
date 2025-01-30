#!/bin/bash
while true; do
echo "====== Generador de Contraseñas ====="
echo "1. Generar una contraseña"
echo "2. Salir"
read -p "Elige una opcion: " opcion
case $opcion in 
1)
#Pedir longitud de la contraseña al usuario
read -p "Introduce la longitud de la contraseña (8-32): " longitud
if [[ ! $longitud =~ ^[0-9]+$ ]] || [[ $longitud -lt 8 ]] || [[ $longitud -gt 32 ]]; then

# <!> significa → Negación de una condición
# <^> significa → inicia una cadena
# <+$> significa → Puedo introducir más de un número 

 echo "Error. Introduce un número del 1 al 32"
continue
fi

read -p "Incluir mayúsculas? (s/n)" mayusculas
read -p "¿Incluir números? (s/n)" numeros
read -p "Incluir caracteres especiales? (s/n)" especiales

#validar que cumpla alguna de las opciones mencionadas, mínimo 1 opción debe decir que si.

if [[ $mayusculas != "s" && $numeros != "s" && $especiales != "s" ]]; then
 echo "Error. Debes incluir al menos un tipo de carácter (mayúsculas, número o especiales)"
continue
fi

minusculas="abcdefghijklmnñopqrstuvwxyz"
caracteres=$minusculas

if [[ $mayusculas == "s" ]]; then
 caracteres+="ABCDEFGHIJKLMNÑOPQRSTUVWXYZ"
fi

if [[ $numeros == "s" ]]; then
 caracteres+="0123456789"
fi

if [[ $especiales == "s" ]]; then
 caracteres+="!@#$%^&*()-_[]{}:;<>?\/"
fi

#Generamos la contraseña de manera aleatoria
password=""
for ((i=0; i < longitud; i++)); do
 rand=$((RANDOM % ${#caracteres}))

 #<RANDOM> significa → variable para generar aleatoriamente
 #<%> significa → Divide RANDOM entre el nº de caracteres
 #<${#caracteres}> significa → Con el nº random generado aleatoriamente saca un carácter
 #de la cadena llamada caracteres 

 password+="${caracteres:$rand:1}"
done 
#<caracteres> significa → nombre de la variable
#<$rand> significa → Selecciona una posición aleatoria de los caracteres en los que el usuario ha dicho sí
#<1> significa → La posición donde empieza a contar para extraer caracteres de las cadenas

 echo "Tu contraseña generada es: $password"
;;
2)
echo "Saliendo del Sistema"
exit 0
;;
*)
echo "Error. Número no válido, por favor introduce el número 1 para generar una contraseña o 2 para salir"
;;
esac
done
