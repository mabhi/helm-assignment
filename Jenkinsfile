pipeline {
    agent any
    environment {
        // The MY_KUBECONFIG environment variable will be assigned
        // the value of a temporary file.  For example:
        //   /home/user/.jenkins/workspace/cred_test@tmp/secretFiles/546a5cf3-9b56-4165-a0fd-19e2afe6b31f/kubeconfig.txt
        MY_KUBECONFIG = credentials('kubeconfig')
    }
    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                // Get some code from a GitHub repository
                git 'https://github.com/mabhi/helm-assignment.git'
            }
        }
        stage('Update') {
            steps {
                echo 'Update helm..'
                sh 'helm dependency update'
            }
        }
        stage('Lint') {
            steps {
                echo 'Linting..'
                sh 'helm lint .'
            }
        }
        stage('Packaging') {
            steps {
                echo 'Packaging..'
                sh 'helm package .'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                sh("helm upgrade -i --kubeconfig $MY_KUBECONFIG ocean-blue .")
            }
        }
    }
}