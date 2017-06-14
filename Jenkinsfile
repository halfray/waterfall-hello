import java.nio.file.Files
def appName = 'hello'
def appGitUrl = ''
def home=System.getProperty("user.home")

node {
    // use pipeline need
    // use pipeline with scm not need
    /** stage('clone source'){
        git(url:appGitUrl,branch:'master',credentialsId:'608d3c73-70d2-4abe-a1f0-0bbf5c846d96')     
    }*/
    stage('check images'){
	sh "if [[ \"\$(docker images -q halfray/$appName 2> /dev/null)\" == \"\" ]];  then docker build -t halfray/$appName .; fi"
    }
    stage('build in docker'){
       withDockerContainer("halfray/$appName") {
            sh "./gradlew clean build"
        }
    }
   stage('check publish path'){
        File file = new File( home + "/" + appName)
        if (!file.exists()) {file.mkdir();}
        sh "rm -rf $home/$appName/*"
   }
    stage('copy and restart docker'){
        sh "mv build/libs/*.war $home/$appName/"
        sh "chmod +x $home/$appName/*.war"
        sh "docker stop $appName || true" 
        sh "docker rm $appName || true"
        sh "docker run -p 8888:8080 -d -v /root/hello:$home/$appName --name $appName --entrypoint=java docker.io/openjdk  -Dgrails.env=prod -jar $home/$appName/*.war"
    }
}
