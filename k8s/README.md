Kubernetes Architecture
===

This guide contain information about resources created by provided yaml defination files on kubernetes cluster.

Architecture is design to ensure DR and HA so that application remain alive and data is persistant and not effected by pod termination or restart. Architecture diagram is also attached for better understanding.

![Architecture](https://i.ibb.co/fVRLGHq/k8-architecture.png)

Created Resources
===
1. Storage Class 
2. Persistance Volume
3. Persistance Volume Claim
4. Deployment for redis with above PVC as volume, ensuring 1 pod is always present
5. Service to expose redis deployment
6. Secret for storing credentials of redis
7. Deployment for python application env variable from secrets. Image is build and push to docker hub for this task.
8. Service of type NodePort on port 30000 to expose deployment of python application.

Requirement
===
Infrastructure stack can be deployed on any kubernetes cluster on-prem or cloud. 

Installation
====
There are 3 yaml defination files are provided as 
-   1.yaml -> This Will create storage resources
-   2.yaml -> This will create resources for redis
-   3.yaml -> This will create resources for python application

We can also merge them into a single file but this grouping make it easy to read.


Access The Application
===
As can be seen from architecture diagram we have craeted a NodePort service for python application which bind the service port to host port and we can access this servie from host using localhost:30000.

Custom DNS
===
We can also set custom DNS e.g.(http://counter-app.local) by adding DNS record in /etc/hosts/ file or simple run the bash script **dns.sh** Then application can be access using  http://counter-app.local:30000.
Furthermore if you want to access application without specifying port we can achieve this using reverse proxy using apahce or nginx server. 