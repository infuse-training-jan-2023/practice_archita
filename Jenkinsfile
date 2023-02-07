pipeline {
    agent {label 'jenkins-slave-archita'}

    stages {
        stage('Build') {
            steps {
                echo 'Build'
            }
        }
        
        stage('Test') {
            steps {
                bat '''ruby testCases.rb'''
            }
        }

        stage('Merge') {
            steps {
                bat '''
                    git switch origin/jenkins/ruby-2
                    git merge origin/jenkins/ruby-3
                    git push -u origin jenkins/ruby-2
                '''
            }
        }
    }
}
