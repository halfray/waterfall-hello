## waterfall-hello 
*Jenkins build and deploy grails project*

#### need environment :
- docker
- jenkins

#### scm pipeline file
- Jenkinsfile

#### tasks
- get repo from git
    
   use jenkins manager credentials
- check docker exists ,if not build it with Docerfile

  build docker will download dependence jar , when build not need download again
- build project
- copy artefact to special path 
- run artefact with docker
