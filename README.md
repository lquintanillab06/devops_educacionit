Pipeline de Jenkins para automatizar la creación de usuarios de un sistema Linux. 

Este Pipeline ejecuta el script bash crear_usuario.sh con la siguientes funciones.

1.	El script recibe tres argumentos (Nombre, Apellido y Departamento)
2.	Pasa los tres argumentos a minúsculas
3.	Extrae la primera letra del nombre y lo concatena con el apellido. 
Ejemplo: si el usuario se llama Juan Mendoza el login quedará jmendoza
4.	Crea el usuario y el directorio del usuario con el comando useradd
5.	Crea un password temporal haciendo el uso de la fecha actual de la creación en segundos.
6.	Se cambia la vigencia del password a menos un día para forzar el cambio de password en el primer inicio de sesión 
7.	Crea el grupo del departamento
8.	Agrega el usuario al grupo creado
9.	Agrega el nombre completo al usuario
10.	Configura la Shell del usuario como /bin/bash
11.	Muestra login, departamento y password temporal

El pipeline es declarativo y se realiza el build con parámetros 

1.	Se realiza el build con parámetros los cuales corresponden a tres parámetros de tipo string, nombre, apellido y departamento.
2.	Solo se ejecuta un stage  “creación de usuarios”.
3.	Se asignan permisos de ejecución al script
4.	Se ejecuta el script con los tres argumentos
