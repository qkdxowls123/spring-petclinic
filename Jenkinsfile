pipeline {
  agent any

  tools {
    jdk 'JDK17'
    maven 'M3'

  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerCredentials')
    AWS_CREDENTIALS = credentials('AWSCredential')
    GIT_CREDENTIALS = credentials('gitCredential')
    REGION = 'ap-northeast-2'
  }
  
  stages {
    stage(Git Clone') {
          steps {
            echo 'Git Clone'
            git url: 'https://github.com/qkdxowls123/spring-petclinic.git'
              branch: 'main', credentialIdL: 'GIT_CREDENTIALS'
          
        }
      }
    }
 }
          
          
    
 



