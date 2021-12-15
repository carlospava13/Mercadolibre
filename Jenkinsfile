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
		sleep 1
             	sh 'cd /Users/carlospava/.jenkins/workspace/MercadoLibre iOS/MercadoLibre'
		sleep 1
		sh 'ls'
		sleep 1
		sh 'bundle exec pod install'
            }
        }
    }
}
