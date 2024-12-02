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
   
  }
}


