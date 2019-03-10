# Install HDP 3.0.1 Sandbox Through Docker on AWS


In order to use the in-browser Java SSH Client to ssh to EC2 instances, please use Firefox.


1. Login in to the AWS Console, and boot an EC2 instance with Amazon Linux 2 AMI:
   - Use >= 16GB of RAM (t2.xlarge and above).
   - Add >=20GB storage.
   - Configure security Group: Add rule for [Type=All TCP, Source=My IP].
   - Keep note the key pair you are using for the EC2 instance.
   - Note the public ip of this instance.
   
   
2. After the EC2 instance is up and running, select the instance, click `Connect`, select
`I would like to connect with A Java SSH Client directly from my browser`.
Specify the path to your key-pair file and connect.


3. Check out the scripts with `git clone https://github.com/qge/hdp.git`, and then `cd hdp`


4. Install docker on the EC2 instance with `bash install_docker.sh`. Logout the SSH client and login again (Step 2).


5. Run `docker info` to confirm docker is working without `sudo`.


6. Install HDP through docker with `bash ./HDP_3.0.1/docker-deploy-hdp30.sh`. It will take a while to install.


7. After it finishes, access Ambari through `http://your-ec2-public-ip:8080/` to confirm it is working.
