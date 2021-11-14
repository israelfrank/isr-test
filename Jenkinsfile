DOCKER_IMG = 'docker.wdf.sap.corp:50000/com.sap.devx.wing/webide-docker-builder:1.11-20210712134948_3089d3630a318870cbc98802fea35af86a855f37'

def chartsWeb = "json.json"  
def chartProduct = "yaml.yaml"
def lastCommit, seconedLastCommit
def command = []
def chartListProduct = []
def chartListWebide = []

pipeline {
    agent any
        
    stages{
        stage("clone pruduct repo and read last and seconed last commit") {
            steps {
                script{
                     dir("isr-test") {
                    checkout([$class: 'GitSCM',
			                branches: [[name: "main"]],
			                userRemoteConfigs: [[credentialsId: '', url: "https://github.com/israelfrank/isr-test.git"]]
			               ])
                    lastCommit = sh(script: """
                                   git rev-parse HEAD
                                   """, returnStdout: true).trim()
                        print lastCommit
                    
                    seconedLastCommit = sh(script: """
                                    git rev-parse @~
                                   """, returnStdout: true).trim()
                        print seconedLastCommit
                        
                        command =  sh(script: """
                                    git diff  --name-only ${lastCommit} ${seconedLastCommit} 
                                   """, returnStdout: true).trim()  
                     }
                     
                }

            }      
        }
         stage("if chart is added so add chart to json") {
                    steps {
                        script{
                            if (command.contains("yaml.yaml") == true ) {
                                
                                chartParams = readJSON  file: chartsWeb
                                chartParams.each { chartName, chartData ->
                                
                                chartListWebide.add(chartName)  
                                }
                                
                                clusterConfiguration = readYaml  file: chartProduct
                                clusterConfiguration.each { chartName, chartData ->
                                
                                // chartListProduct.add(chartName)
                                if chartListWebide.contains(chartName)  
                                  print "done"
                                }
        
                                print chartListWebide
                                           
                    }
               } 
            }   
        }
    }   
}