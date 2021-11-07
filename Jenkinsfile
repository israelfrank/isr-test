DOCKER_IMG = "jenkins/slave"
pipeline {
     agent {
            docker {
                label "DockerSlave"
                image DOCKER_IMG
            }
        }
    stages {
        stage('Checkout master Branch') {
            steps {
                script{
                  
                    sh "helm install example  mychart"
      
                }
            }
        }
    
       
    }
}
