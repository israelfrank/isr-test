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
         stage('helm install') {
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
    post {
        failure {  
             mail bcc: '', body: "fail: ${env.JOB_NAME} <br>Build Number: ${env.BUILD_NUMBER}", cc: '', charset: 'UTF-8', from: '', mimeType: 'text/html', replyTo: '', subject: "ERROR : Project name -> ${env.JOB_NAME}", to: "devops@sap.com";  
         }  
    }
}
