pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git branch: 'develop', credentialsId: '7fb26cc0-5703-4ec3-876b-7576d2ee8e43', url: 'https://github.com/carlospava13/Mercadolibre.git'
            }
        }
        stage('Dependencies ') {
            steps {
              #!/bin/bash

              rvm_path=/usr/local/rvm

              sh /etc/profile.d/rvm.sh

              [[ -s "$rvm_path/scripts/rvm" ]] && source "$rvm_path/scripts/rvm"

              #Use the correct ruby
              rvm use "1.9.3"

              rvm 1.9.3 do pod install
            }
        }
    }
}
