STEP.1-CREATE DOCKERFILE AND RUN APPLICATION ON DOCKER-COMPOSE



. launch server on AWS with port 80 ,3000.

. Install Docker and Docker-compose on server.

.Create dockerfile with name “Dockerfile” and creat docker-compose.yaml file and call
  Docker file in docker-compose file.

 NOTE- to run docker-compose make sure your docker and docker-compose version should be same .
       
  
. A- hit command docker-compose build           ------to build docker images


. B- hit command docker-compose up -d           -------to run a container  


. hit server-ip:3000

a) 3.109.54.138:3000/messages                hiting this got following output


      [{"id":"1","text":"HelloWorld","userId":"1"},{"id":"2","text":"By World","userId":"2"}]
      
 b)   3.109.54.138:3000/messages/1  

 
                                    {"id":"1","text":"Hello World","userId":"1"}  
         
c)  3.109.54.138:3000/users

                                    [{"id":"1","username":"Robin Wieruch"},{"id":"2","username":"Dave Davids"}]
     
d) )  3.109.54.138:3000/users1

                                    {"id":"1","username":"Robin Wieruch"}
                     
      *****SUCCESSFULLY CREATE DOCKERFILE AND RUN APPLICATION ON DOCKER-COMPOSE FROM FOLLOWING UPPER STEPS******


STEP.2- CREATE A GITHUB REPOSITORY NAMED "saharerahul/Node.js-Application


STEP.3-Configure webhook on GitHub. Go to Settings >> Webhooks >> Add webhook >> Paste here Jenkins server URL >> Add webhook. 
       Also, click on GitHub webhook trigger on Jenkins server. Now, whenever code is pushed to GitHub, images will be created automatically.

       

STEP.4-CREATE CI USING JENKINS TO BUILD AND PUSH DOCKER IMAGES TO DOCKER HUB.

      . launch Jenkins server on AWS with port 8080
      
      . To install Docker on the same server where Jenkins is running and grant Jenkins permission to execute Docker commands,
         by "sudo usermod -aG docker jenkins".
         
      . Install required plugins for Jenkins. Go to "Manage Jenkins" >> "Manage Plugins" >> "Available" >> search and select Docker, Docker Pipeline, and Git 
         plugins. Then, click "Install".
   
      . Adding Docker Hub credentials: Go to "Manage Jenkins" >> "Credentials" >> "Add Credentials" >> "Global credentials" >> add.

      . Now configure job and write Jenkins pipeline to build and push Docker image.

      . Successfully build Docker images and push Docker image named   "rahulsahare/nodejs-app:latest"  

      . This is the URL of my Docker Hub repository:      https://hub.docker.com/r/rahulsahare/nodejs-app 


 STEP.5-CREATE AN EKS CLUSTER USING TERRAFORM




        .Create VPC
        
        .Create subnets.
        
        .Create EC2 instance as a  Bastion host.
        
        .Create security group for Kubernetes.
        
        .Create IAM role.
        
        .Create IAM policy. 
        
          a) AmazonEKSClusterPolicy
          
          b) AmazonEKSServicePolicy
          
          c) AmazonEKSServicePolicy
          
          d) AmazonEKSCNIPolicy
        
        .Attach role.
        
        .Create EKS cluster.
        
        .Create node group.


    STEP.6-  DEPLOY APPLICATION ON CREATED CLUSTER


        . After succsessfuly creating eks-cluster takig ssh of Bastion host .  
        
           NOTE ----"You should have created a key in your AWS account for the bastion host named 'task' to access the bastion server."

        . "Installing the AWS CLI and configuring it with 'aws configure'." 
        
        . Install kubectl on the bastion server to interact with the Kubernetes cluster.

        . fire following command to enbale kubectl to intract with eks cluter
        
        . "aws eks update-kubeconfig --region  ap-south-1  --name  ed-eks-01"  

        . Install a HELM

        . Hit command helm "create nodejs-app"     go inside created directory  

        . Go inside the values.yaml file and add image  and tag in image section "rahulsahare/nodejs-app"  tag: latest 
           and service type with port  "LoadBalancer" "3000" .

         .  go to root directory  and hit   command "heml install app nodejs-app"  
         
         .  pod cerated successfully application  deployed and we will get loadbalacer DNS hit with port 3000.


         
         a) DNS:3000/messages                hiting this got following output


                                [{"id":"1","text":"HelloWorld","userId":"1"},{"id":"2","text":"By World","userId":"2"}]


      
          b)   DNS:3000/messages/1  

 
                                    {"id":"1","text":"Hello World","userId":"1"}  

                                    
         
          c)  DNS:3000/users

                                    [{"id":"1","username":"Robin Wieruch"},{"id":"2","username":"Dave Davids"}]

                                    
     
          d)  DNS:3000/users1

                                    {"id":"1","username":"Robin Wieruch"}


        
                   
               *********"SUCCESSFULLY DEPLOYED APPLICATION ON CREATED CLUSTER"*********      


 STEP-7- MONITORING CREATED APPLICATION USING PROMETHEUS AND GRAFANA

        .  Launch server on aws with ports 9090, 3000, 9115 
        
        .  installing Prometheus and Grafana and black-box-exporter on same server
        
        .  using prometheus with black-box-exporter to extract log form application and sending to grafana for visulization as graph
        
        .  open a prometheus.yml file where we have to add job and where we add application url which we want to monitor
           and black-box-exporter server url with port.
           
        .  now we have to add prometheus on grafana server as a datasource to visulize a logs in graph 
        
        .  go grafana server >>connection >> data source >> add datasource >> select promtheus >> and and prometheus server url
        .  creat dashboard for black-box go to import dashboar .
        
        . now we can monitor application
        



      
      




  



