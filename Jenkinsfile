pipeline {
    agent any

    stages {
        stage('CI') {
            steps {
                git url:'https://github.com/abdelkhalek97/todo-app-task.git',branch:'main'
                withCredentials([usernamePassword(credentialsId: 'docker', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]){
                sh """
                docker login -u ${USERNAME} -p ${PASSWORD}
                systemctl start docker
                docker build -f Dockerfile -t abdelkhalek97/Todo-app .
                docker push abdelkhalek97/Todo-app
                """
            
            }
            }
            
        }
        stage('CD'){
            steps{
                     withCredentials([usernamePassword(credentialsId: 'docker', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]){
                sh """
                docker login -u ${USERNAME} -p ${PASSWORD}
                docker run -d -p 8080:8080 -d abdelkhalek97/Todo-app
                docker ps -a
                """
                     }
            }
        }
        
    }
}
