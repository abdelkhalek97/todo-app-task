pipeline {
    agent any

    stages {
        stage('CI') {
            steps {
                git url:'https://github.com/abdelkhalek97/todo-app-task.git',branch:'main'
                withCredentials([usernamePassword(credentialsId: 'docker', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]){
                sh """
                docker login -u ${USERNAME} -p ${PASSWORD}
                docker build -f Dockerfile -t abdelkhalek97/todo-app .
                docker push abdelkhalek97/todo-app
                """
            
            }
            }
            
        }
        stage('CD'){
            steps{
                sh '''
                docker rm -f $(docker ps |grep abdelkhalek97/todo-app | cut -d ' ' -f 1) || true
                docker run -d -p 8080:8080 -d abdelkhalek97/todo-app
                '''
            }
        }
        stage('Testing') {
            steps {

                sh '''
                docker exec $(docker ps |grep abdelkhalek97/todo-app | cut -d ' ' -f 1) bash -c 'yarn test:unit -u ; yarn test:e2e --headless'
                docker ps | grep abdelkhalek97/todo-app
                '''
            
            }
            
        }
        
    }
}
