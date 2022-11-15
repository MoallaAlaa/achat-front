pipeline {
    agent any
    
    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "M2_HOME"
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
                git branch:"AlaaMoalla",
                url:'https://github.com/MEJRIWIEM/Groupe_Techers_5SAE5.git'
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

                    dockerImage = docker.build("alaamoalla/springboot-achat:achat-spring")  

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

                sh "docker rmi alaamoalla/springboot-achat:achat-spring" 

            }

        } 

}

    }