# Todo-App

This is a repo used in a jenkins pipeline to CI/CD and testing simple node application .\
application used : https://github.com/dobromir-hristov/todo-app
- custom jenkins image that has docker installed.
- The application is deployed on the local machine ip and port 8080.
- The application is tested using Unit: Jest + Vue Test Utils and E2E: Cypress.

### Installing Jenkins

Run custom jenkins image in detached mode on port 8081 and attaching docker daemon to the container.
```
docker run -d -p 8081:8080 -v /var/run:/var/run -v jenkins_home:/var/jenkins_home abdelkhalek97/custom-jenkins
```
- Jenkins will be running on machine localhost on port 8081 , if the port is already used please chose another.
- http://localhost:8081/

#### Configuring Jenkins
- Add docker logging credentials by navigatiing to manage jenkins -> manage credentials -> global -> add credentials.\
![home_Page Image](./Images/manage-credentials.png)\
![home_Page Image](./Images/global.png)\
![home_Page Image](./Images/add-credentials.png)\
![home_Page Image](./Images/docker.png)

- Now navigate to new item and choose pipeline type.
![home_Page Image](./Images/pipe.png)
- Insert git repo link : https://github.com/abdelkhalek97/todo-app-task.git 
- Choose main branch.
![home_Page Image](./Images/configure.png)
- Save and build now.\
![home_Page Image](./Images/build.png)\
![home_Page Image](./Images/test.png)\
![home_Page Image](./Images/success.png)

### Application
- http://localhost:8080/
- application will be running on machine localhost on port 8080.\
![home_Page Image](./Images/app.png)

### Note
- CustomJenkins is the Dockerfile code that was used to build jenkins custom image.
- In case of running a container of the todo app:
```
docker run -d -p 8080:8080 abdelkhalek97/todo-app
```
- make sure that port 8080 isn't used or chose another port
