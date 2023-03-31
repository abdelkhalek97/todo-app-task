# Todo-App

This a repo used in a jenkins pipeline to CI/CD and testing simple node application .\
application used : https://github.com/dobromir-hristov/todo-app
- custom jenkins image that has docker installed.
- The application is deployed on the local machine ip and port 8080.
- The application is tested using Unit: Jest + Vue Test Utils and E2E: Cypress.

### Installing Jenkins

Run custom jenkins image in detached mode on port 8081 and attaching docker daemon to the container.
```
docker run -d -p 8081:8080 -v /var/run:/var/run -v jenkins_home:/var/jenkins_home abdelkhalek97/custom-jenkins
```
#### Configuring Jenkins

