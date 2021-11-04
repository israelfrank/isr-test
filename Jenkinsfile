DOCKER_IMG = 'israelfrank/sap:latest'
pipeline {
    agent {
        docker {
            label "docker_slave"
             image DOCKER_IMG
        }
    }
    environment {

    }
    stages {
        stage('Checkout master Branch') {
            steps {
                script{
                    checkout([$class: 'GitSCM',
			                branches: [[name: "master"]],
			                userRemoteConfigs: [[credentialsId: 'SAP', url: "https://github.com/israelfrank/devops-test.git"]]
			               ])
              
      
                }
            }
        }
    
       
    }
}
