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
					
					echo "Hola, ${params.nombre} ${params.apellido}, ."
					echo "Tu departamento es ${params.departamento}"
				} 
			}
		}
	}

}
