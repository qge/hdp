# Install HDP 3.0.1 Sandbox Through Docker on AWS

This is a summary of the official HDP tutorial https://hortonworks.com/tutorial/sandbox-deployment-and-install-guide/section/3/


In order to use the in-browser Java SSH Client to ssh to EC2 instances, please use Firefox.

## Steps
1. Login in to the AWS Console, and boot an EC2 instance with Amazon Linux 2 AMI:
   - Use >= 16GB of RAM (t2.xlarge or above).
   - Add >=20GB storage.
   - Configure security Group: Add rule for [Type=All TCP, Source=My IP]. It is important to restrict access only to your IP. Do not make it open to the wild.
   - Keep note the key pair you are using for the EC2 instance.
   - Note down the public ip of this instance. This is the IP address you are going to use to access HDP services and web UIs.
   
   
2. After the EC2 instance is up and running, select the instance, click `Connect`, select
`I would like to connect with A Java SSH Client directly from my browser`.
Specify the path to your key-pair file and connect.


3. Install git with `sudo yum install -y git`. Check out the scripts with `git clone https://github.com/qge/hdp.git`, and then `cd hdp`.


4. Install docker on the EC2 instance with `bash install_docker.sh`. Logout the SSH client and login again (Step 2).


5. Run `docker info` to confirm docker is working without `sudo`.


6. `cd hdp` if you are not in the `hdp` directory yet. Install HDP through docker with `bash ./HDP_3.0.1/docker-deploy-hdp30.sh`. It will take a while to install.


7. After it finishes, access Ambari through `http://your-ec2-public-ip:8080/` to confirm it is working.

## HDP Sandbox Port Forwards
(https://hortonworks.com/tutorial/hortonworks-sandbox-guide/section/3/)

- 2122  ->  22      HostSSH
- 2200  ->  22      HostSSH2
- 2222  ->  2222    DockerSSH
- 7777  ->  7777    Streaming Analytics Manager
- 8585  ->  8585    Streams Messaging Manager
- 7788  ->  7788    Schema Registry
- 8000  ->  8000    Storm Logviewer
- 9995  ->  9995    Zeppelin1
- 9996  ->  9996    Zeppelin2
- 9088  ->  9088    NiFi Protocol
- 61080 ->  61080   NiFi Registry
- 8886  ->  8886    AmbariInfra
- 61888 ->  61888   Log Search
- 10500 ->  10500   HS2v2
- 4040  ->  4040    Spark
- 4200  ->  4200    AmbariShell
- 8983  ->  8983    SolrAdmin
- 42080 ->  80      Apache
- 42111 ->  42111   nfs
- 8020  ->  8020    HDFS
- 8040  ->  8040    nodemanager
- 8032  ->  8032    RM
- 8080  ->  8080    ambari
- 8443  ->  8443    Knox
- 8744  ->  8744    StormUI
- 1080  ->  1080    Splash Page
- 8993  ->  8993    Solr
- 10000 ->  10000   HS2
- 10001 ->  10001   HS2Http
- 10002 ->  10002   HiveJDBCJar
- 30800 ->  30800   DAS
- 11000 ->  11000   Oozie
- 15000 ->  15000   Falcon
- 19888 ->  19888   JobHistory
- 50070 ->  50070   WebHdfs
- 50075 ->  50075   Datanode
- 50095 ->  50095   Accumulo
- 50111 ->  50111   WebHcat
- 16010 ->  16010   HBaseMaster
- 16030 ->  16030   HBaseRegion
- 60080 ->  60080   WebHBase
- 6080  ->  6080    XASecure
- 18080 ->  18080   SparkHistoryServer
- 8042  ->  8042    NodeManager
- 21000 ->  21000   Atlas
- 8889  ->  8889    Jupyter
- 8088  ->  8088    YARN
- 2181  ->  2181    Zookeeper
- 9090  ->  9090    Nifi
- 4557  ->  4557    NiFi DistributedMapCacheServer
- 6627  ->  6627    Storm Nimbus Thrift
- 9000  ->  9000    HST
- 6667  ->  6667    Kafka
- 9091  ->  9091    NiFi UI HTTPS
- 2202  ->  2202    Sandbox SSH 2
- 8188  ->  8188    YarnATS
- 8198  ->  8198    YarnATSR
- 9089  ->  9089    Druid1
- 8081  ->  8081    Druid2
- 2201  ->  2201    SSH HDP CDA

The default Ambari credential is `raj_ops:raj_ops`. The default AmbariShell login credential is `root:hadoop`.
