pipeline {
    agent any
    
    tools {
        nodejs "815Node"
    }
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

stage('INSTALL PACKAGES') {
      steps {
        sh "npm install"
      }
    }

    stage('BUILD APP') {
      steps {
        sh "node_modules/.bin/ng build --prod"
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