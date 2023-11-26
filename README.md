# terraform-drift-detection
Terraform cofiguration as a source of truth has been main advantage of using Terraform. But in long run someone changes configuration from console and this managing infrastructure difficult. 
Difference between infrastructure managed by Terraform and changes made from console is popularly called as Terraform drift. 
The main objective of this porject is to detect terraform drift and notify the user either through the slack or email. 

This projects Terrafrom plan to detect drift in the resources. And to find user who has made these changes I have used cloudtrail. 

drif-detection.py uses boto3 for creating clodtrail client. 

Jenkins has been used as automation server which checks for drift every day. Cofiguration for this is written in jenkinfile. 

<img src="/img/Screenshot 2023-11-26 160318.png">
<img src="/img/Screenshot 2023-11-26 161748.png">
