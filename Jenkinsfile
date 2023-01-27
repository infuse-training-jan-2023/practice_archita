pipeline {
    agent any

    stages {
        stage('build') {
            steps {
                javac DuplicateCharacters.java
                java DuplicateCharacters
            }
        }
    }
}