#!/bin/bash

# Recibe nombre apellido y departamento
# 1. Crear usuario con la inicial del nombre y el apellido
# 2. Asginar un password temporal y mostrarlo en la consola
# 3. Forzar al usuario que cambie el password en el primer inicio de sesion
# 4. Validar si el grupo del departamento existe si no crearlo
# 5. Asginar el usuario al grupo del departamento


if [ "$#" -eq 3 ]; then
        nombre=$( echo $1 | tr "[:upper:]" "[:lower:]")
        apellido=$( echo $2 | tr "[:upper:]" "[:lower:]")
        departamento=$(echo $3 | tr "[:upper:]" "[:lower:]")

        inicial_nombre=$(echo $nombre | cut -c 1)
        usuario=$( echo "$inicial_nombre$apellido" )
        echo $usuario
        sudo useradd -d "/home/$usuario" -m "$usuario"
        password_temp=$(date +%s)
        echo -e "$password_temp\n$password_temp" | sudo passwd "$usuario"
        sudo chage -d 0 "$usuario"

        #if [ ! grep -eq "^$departamento:" /etc/group ]; then
        sudo groupadd $departamento
        #fi
        sudo usermod -aG $departamento $usuario
        sudo usermod -c "$nombre $apellido" $usuario
        sudo usermod -s /bin/bash $usuario
        cat /etc/passwd | grep "$usuario"
        cat /etc/group | grep "$departamento"
        echo "Password temporal:  $password_temp"

else
        echo " Debe ingresar Nombre Apellido y Departamento"
fi