
pipeline {
    agent any

    environment {
        FLUTTER = 'C:/temp/flutter_windows_3.44.1-stable/flutter/bin/flutter.bat'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Check Flutter') {
            steps {
                bat '"%FLUTTER%" --version'
            }
        }

        stage('Install Dependencies') {
            steps {
                bat '"%FLUTTER%" pub get'
            }
        }

        stage('Code Analysis') {
            steps {
                bat '"%FLUTTER%" analyze'
            }
        }

        stage('Run Tests') {
            steps {
                bat 'if exist test ("%FLUTTER%" test) else (echo No test directory found - skipping tests)'
            }
        }

        stage('Build Android APK') {
            steps {
                bat '"%FLUTTER%" build apk --release'
            }
        }

        stage('Archive APK') {
            steps {
                archiveArtifacts artifacts: 'build/app/outputs/flutter-apk/app-release.apk',
                                 fingerprint: true
            }
        }
    }

    post {
        success {
            echo 'Food Delivery App pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check the Console Output.'
        }
    }
}
