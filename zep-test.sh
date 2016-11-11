#!/bin/bash

aws emr create-cluster \
--termination-protected \
--applications Name=Hadoop \
 Name=Spark Name=Zeppelin \
--bootstrap-actions \
'[{"Path":"s3://<path to setup script>","Name":"Custom action"}]' \
--ec2-attributes '{"KeyName":"<key name>","InstanceProfile":"EMR_EC2_DefaultRole","SubnetId":"subnet-3d855666","EmrManagedSlaveSecurityGroup":"sg-25c43958","EmrManagedMasterSecurityGroup":"sg-2bc43956"}' \
--service-role EMR_DefaultRole \
--enable-debugging \
--release-label emr-5.1.0 --log-uri '<logging folder>' \
--name 'My cluster' \
--instance-groups '[{"InstanceCount":1,"BidPrice":"0.02","InstanceGroupType":"MASTER","InstanceType":"m1.large","Name":"Master instance group - 1"},{"InstanceCount":1,"BidPrice":"0.02","InstanceGroupType":"CORE","InstanceType":"m1.large","Name":"Core instance group - 2"}]' \
--region us-east-1
