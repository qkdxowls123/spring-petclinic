pipeline {
  agent any

  tools {
    jdk 'jdk17'
    maven 'M3'

  }
  enviroment {
    DOCKERHUB_CREDENTIALS = credentials('dockerCredentials')
  }
  
  stages {

    stage('Git Clone') {
      steps {
        git url:'https://github.com/qkdxowls123/spring-petclinic.git', branch: 'main'
        
      }
    }

    stage('Maven Build') {
      steps {
        sh 'mvn -Dmaven.test.failure.ignore=true clean package'
      }
    } 
    stage('Docker Image') {
      steps {
//        dir ('${env.WORKSPACE}') {
          sh """
          docker build -t bangtaejin/spring-petclinic:$BUILD_NUMBER .
          docker tag bangtaejin/spring-petclinic:$BUILD_NUMBER bangtaejin/spring-petclinic:latest
          """
//        }
        }    
      }

      stage ('Docker Image Push') {
        sh """
        echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
        docker push bangtaejin/spring-petclinic:latest
        """
    }

            
  }



