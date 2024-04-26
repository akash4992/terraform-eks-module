pipeline {
    agent any
    parameters {
        string(name: 'MyName', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')
    }
    environment { 
        DevPublishPort = '1045'
        ProdPublishPort = '1046'
        MyVariable = 'gValue Here'
    }
    stages {
        stage('printing variables'){
            environment { 
                MyVariable1 = 'In PrintVariable'
            }
            steps{
                echo "${MyName}"
                echo "${MyVariable}"
                echo "${MyVariable1}"
            }
        }
       
        stage('Build') {
            steps {
                echo "${MyVariable}"
                sh 'echo ${MyVariable1}'
                sh ''' docker image build -t mysamplenodejs:${BUILD_ID} . '''
            }
        }
        stage('Push Image') {
            steps {
                // push image to docker registry using below command
                // sh 'docker login -u youUsername -p YourPassword'
                // sh 'docker image push coolgourav147/mysamplenodejs:${BUILD_ID}'
                echo 'Pushing image to docker registry'
            }
        }
        stage('Deploy on test') {
            steps {
                sh 'docker container run -itd -p ${DevPublishPort}:8080 mysamplenodejs:${BUILD_ID}'
                //echo 'Hello Deploy on test'
            }
        }
        stage('Deploy on prod') {
            steps {
                sh 'docker container run -itd -p ${ProdPublishPort}:8080 mysamplenodejs:${BUILD_ID}'
                echo 'Hello Deploy on prod'
            }
        }
    }
    post { 
        always { 
            echo 'I will always say Hello again!'
        }
        aborted {
             echo 'aborted'
        }
        success {
            echo 'success'
        }
        failure {
            echo 'failure'
        }
    }
}
