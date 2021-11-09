DOCKER_IMG = "jenkins/slave"
pipeline {
     agent any
    stages {
        stage('pull image') {
            steps {
                script{
                  
                    sh "docker pull israelfrank/sap:latest"
      
                }
            }
        }
         stage('Checkout master Branch') {
            steps {
                 script {
                    sh """
                         export KUBECONFIG=/var/lib/jenkins/config
                         kubectl create ns jenkins-${BUILD_NUMBER}
                         helm install example  mychart -n jenkins-${BUILD_NUMBER}
                         sleep 10
                         kubectl get pods -n jenkins-${BUILD_NUMBER}
                       """
     
                }
            }
        }
 
    }
}
