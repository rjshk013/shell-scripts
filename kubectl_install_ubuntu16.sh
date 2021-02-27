#!/bin/bash

#To install kubectl on Linux,Download the Amazon EKS vended kubectl binary for your cluster's #Kubernetes version from Amazon S3
curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.18.9/2020-11-02/bin/linux/amd64/kubectl

#Apply execute permissions to the binary.
chmod +x ./kubectl

#Copy the binary to a folder in your PATH
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin

#(Optional) Add the $HOME/bin path to your shell initialization file so that it is configured when #you open a shell. 
echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc

#After you install kubectl , you can verify its version with the following command:
kubectl version --short --client
