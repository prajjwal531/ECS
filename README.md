# Solution

### Pre Req
1. AWS Accunt
2. AWS CLI
3. AWS Profile set up

### Deploy the solution

This solution can be deployed by running following command.

Please change subnet and vpc value in deploy.sh ( Subnet will internet access is preferable).
Also Please over ride the certificat arn in Cloudformation template

sh deploy.sh

#### Steps ( performed while running this script)

1. Create the ECR Repository.
2. Build the Docker image.
3. Push the image to ECR Repository.
4. Deploy Cloudformation.
   4.1 Create ECS Cluster.
   4.2 Create Task Definition and Service
   4.3 Create ALB
   4.4 Point ALB to ECS Cluster.
5. Test the endpoint.

### Test the solution

By Clicking DNS name of the ALB in the output of deployed stack

such as: webappLoadBalancer-456111887.us-east-1.elb.amazonaws.com


