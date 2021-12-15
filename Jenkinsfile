pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git branch: 'develop', credentialsId: '7fb26cc0-5703-4ec3-876b-7576d2ee8e43', url: 'https://github.com/carlospava13/Mercadolibre.git'
            }
        }
        stage('Dependencies') {
            steps {
		sleep 11
             	sh 'cd MercadoLibre'
		sh 'ls'
		sleep 1
		sh 'bundle exec pod install'
            }
        }
    }
}
