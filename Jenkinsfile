pipeline{
	agent any
	parameters{
		string(name: 'nombre', defaultValue:'', description: 'Ingresa el nombre: ')
		string(name: 'apellido', defaultValue:'', description: 'Ingresa el apellido: ')
		string(name: 'departamento', defaultValue:'', description: 'Ingresa el deepartamento: ')
	}
	stages {
		stage('Input') {
			steps {
				//sh './crear_usuario.sh ${params.nombre} ${params.apellido} ${params.departamento}'
				script {
					// Los parametros pueden ser accedidos mediante params.parameterName
					//echo "Hola, ${params.nombre} ${params.apellido}, ."
					//echo "Tu departamento es ${params.departamento}"
					nombre=$( echo ${params.nombre} | tr "[:upper:]" "[:lower:]")
					apellido=$( echo ${params.apellido} | tr "[:upper:]" "[:lower:]")
					departamento=$(echo ${params.departamento} | tr "[:upper:]" "[:lower:]")
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

				} 
			}
		}
	}

}
