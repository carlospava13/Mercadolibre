pipeline {
    agent { label 'ios-build' }
    
    environment {
        DEVELOPER_DIR = '/Applications/Xcode.app/Contents/Developer'
        LANG          = 'en_US.UTF-8'
        LC_ALL        = 'en_US.UTF-8'
        PROJECT_DIR   = 'MercadoLibre'
    }

    stages {
        stage('1. Limpieza') {
            steps {
                deleteDir()
            }
        }
        
        stage('2. Checkout Automático') {
            steps {
                // Esta línea mágica descarga automáticamente la rama del PR o la rama actual
                checkout scm
            }
        }

        stage('3. Dependencias (CocoaPods)') {
            steps {
                dir("${env.PROJECT_DIR}") { 
                    sh '/opt/homebrew/bin/pod install'
                }
            }
        }

        stage('4. Build & Unit Tests') {
            steps {
                dir("${env.PROJECT_DIR}") {
                    sh '''
                        xcodebuild test \
                        -workspace MercadoLibre.xcworkspace \
                        -scheme MercadoLibreTests \
                        -destination "platform=iOS Simulator,name=iPhone 16,OS=18.6" \
                        -quiet
                    '''
                }
            }
        }
    }
    
    post {
        success { echo "--- ✅ BUILD EXITOSO ---" }
        failure { echo "--- ❌ BUILD FALLIDO ---" }
    }
}
