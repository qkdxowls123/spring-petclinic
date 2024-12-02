pipeline {
  agent any

  tools {
    jdk 'jdk17'
    maven 'M3'

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
        dir ('${env.WORKSPACE}') {
          sh """
          docker build -t bangtaejin/spring-petclinic:$BULID_NUMBER .
          docker tag bangtaejin/spring-petclinic:$BULID_NUMBER bangtaejin/spring-petclinic:latest
          """
          }
        }    
      }
    }

            
  }



