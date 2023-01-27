pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                bat "git clone https://github.com/infuse-training-jan-2023/practice_archita/"
                bat "cd practice_archita"
                bat "git switch jenkins/ruby"
                bat "ruby printArrayElements2.rb"
            }
        }

        stage('Test') {
            steps {
                bat "git clone https://github.com/infuse-training-jan-2023/practice_archita/"
                bat "cd practice_archita"
                bat "git switch jenkins/ruby"
                bat "ruby testCases2.rb"
            }
        }

        stage('Merge') {
            steps {
                bat "git clone https://github.com/infuse-training-jan-2023/practice_archita/"
                bat "cd practice_archita"
                bat "git switch jenkins/ruby"
                bat "git merge jenkins/ruby-1"
            }
        }
    }
}