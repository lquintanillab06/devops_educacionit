pipeline{
	agent any
	parameters{
		string(name: 'name', defaultValue:'', description: 'Ingresa el nombre: ')
		string(name: 'apellido', defaultValue:'', description: 'Ingresa el apellido: ')
		string(name: 'departamento', defaultValue:'', description: 'Ingresa el deepartamento: ')
	}
	stages {
		stage('Input') {
			steps {
				sh './get_file.sh ${params.name} ${params.apellido} ${params.departamento}'
				/* script {
					// Los parametros pueden ser accedidos mediante params.parameterName
					
					echo "Hola, ${params.name}! Tienes ${params.age} de edad."
				} */
			}
		}
	}

}
