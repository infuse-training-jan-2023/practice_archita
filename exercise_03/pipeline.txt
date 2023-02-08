pipeline {
    agent {label 'jenkins-slave-archita'}

    stages {
        stage('build') {
            steps {
                echo env.STAGE_NAME
            }
        }
        
        stage('test') {
            steps {
                echo env.STAGE_NAME
            }
        }
    }
}
