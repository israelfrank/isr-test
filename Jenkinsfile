import groovy.json.JsonSlurper

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
                                if (!chartListWebide.contains(chartName)) { 
                                  sh """
                                    jq '.$chartName':{}' json.json" > json.json
                                  """
                                }
                                }
        
                                print chartListWebide
                                           
                    }
               } 
            }   
        }
    }   
}