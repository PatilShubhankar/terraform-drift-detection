# terraform-drift-detection
Terraform cofiguration as a source of truth has been main advantage of using Terraform. But in long run someone changes configuration from console and this managing infrastructure difficult. 
<br>
Difference between infrastructure managed by Terraform and changes made from console is popularly called as Terraform drift. 

<br>
The main objective of this porject is to detect terraform drift and notify the user either through the slack or email. 

<br>
This projects Terrafrom plan to detect drift in the resources. And to find user who has made these changes I have used cloudtrail. 

drif-detection.py uses boto3 for creating clodtrail client. 

Jenkins has been used as automation server which checks for drift every day. Cofiguration for this is written in jenkinfile. 

<img src="/img/Screenshot 2023-11-26 161748.png">






I have made changes manually to terraform managed resources. 
drif-detection.py is able to detect AWS username who has made those changes. 
<img src="/img/Screenshot 2023-11-26 163204.png">

If AWS username and Slack username is same, we can send personal message on slack to user who has made these changes. 
