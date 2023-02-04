pipeline {
    agent {label 'jenkins-slave-archita'}

    stages {
        stage('Test') {
            steps {
                bat "git clone https://github.com/infuse-training-jan-2023/practice_archita/"
                bat "cd practice_archita"
                bat "git switch jenkins/ruby-1"
                bat "ruby testCases2.rb"
            }
        }

        stage('Merge') {
            steps {
                bat "git switch jenkins/ruby"
                bat "git merge jenkins/ruby-1"
                bat "git commit -m 'merge jenkins/ruby-1 into jenkins/ruby'"
            }
        }
    }
}