pipeline {
  agent any

  tools {
    jdk 'JDK17'
    maven 'M3'

  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerCredential')
    AWS_CREDENTIALS = credentials('AWSCredential')
   // GIT_CREDENTIALS = credentials('gitCredential')
    REGION = 'ap-northeast-2'
  }
  
  stages {
    stage('Git Clone') {
          steps {
            echo 'Git Clone'
            git url: 'https://github.com/qkdxowls123/spring-petclinic.git',
              branch: 'main'
          
        }
      }
    //maven 빌드작업
    stage('Maven Build') {
      steps {
        echo 'Maven Build'
        sh 'mvn -Dmaven.test.failure.ignore=true clean package'
      }
    }
    //docker 이미지 빌드 작업
    stage('Docker Image Build') {
      steps {
        echo 'Docker Images build'
        dir("${env.WORKSPACE}") {
          sh """          
          docker build -t bangtaejin/spring-petclinic:$BUILD_NUMBER .
          docker tag bangtaejin/spring-petclinic:$BUILD_NUMBER bangtaejin/spring-petclinic:latest
          """
        }
      }
    }
    ///docker login and image push
    stage('Docker Login') {
      steps {
        sh """
        echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
        docker push bangtaejin/spring-petclinic:latest
        """
      }
    }
    //docker image 삭제
    stage('Remove Docker Image') {
      steps {
        sh """
        docker rmi bangtaejin/spring-petclinic:$BUILD_NUMBER
        docker rmi bangtaejin/spring-petclinic:latest
        """
      }
    }

// S3에 Appspec.yml과 실행 스키립트 저장
        stage('Upload to S3') {
            steps {
                echo "Upload to S3"
                dir("${env.WORKSPACE}") {
                    sh 'zip -r deploy.zip ./deploy Appspec.yml'
                    withAWS(region:"${REGION}", credentials:"${AWS_CREDENTIALS}"){
                      s3Upload(file:"deploy.zip", bucket:"user06-codedeploy-bucket")
                    } 
                    sh 'rm -rf ./deploy.zip'                 
                }        
            }
        }
    
    }
 }
          
          
    
 



