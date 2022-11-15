pipeline {
    agent any
    
    
environment {
        registry = "alaamoalla/alpine" 
        registryCredential = 'dockerHub' 
        dockerImage = '' 
    }

    stages {
        stage('GIT'){
            steps{
                echo 'Getting Project from GIT';
                git branch:"main",
                url:'https://github.com/MoallaAlaa/achat-front.git'
            }
}

stage('Fetch dependencies') {
  agent {
    docker 'node:14.19.2-slim'
  }
  steps {
    sh 'yarn'
    stash includes: 'node_modules/', name: 'node_modules'
  }
}
stage('Compile') {
  agent {
    docker 'node:14.19.2-slim'
  }
  steps {
    unstash 'node_modules'
    sh 'yarn build:prod'
    stash includes: 'dist/', name: 'dist'
  }
}
        stage('Building our image') { 

            steps { 

                script { 

                    dockerImage = docker.build("alaamoalla/angular-achat:achat-angular")  

                }

            } 

        }

        stage('Deploy our image') { 

            steps { 

                script { 

                    docker.withRegistry( '', registryCredential ) { 

                        dockerImage.push() 

                    }

                } 

            }

        } 

        stage('Cleaning up') { 

            steps { 

                sh "docker rmi alaamoalla/angular-achat:achat-angular" 

            }

        } 

}

    }