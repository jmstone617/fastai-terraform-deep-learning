# Deep Learning Stack

## Overview
This is a Terraform plan to spin up a deep learning stack on various cloud platforms (currently only AWS).

The AWS instance you'll get from this plan is specifically for the Deep Learning course by Fast.ai, found here: http://course.fast.ai/start.html

### Prerequisites
You should have terraform installed. If you don't yet have it installed, go to https://www.terraform.io/downloads.html and follow the instructions for your OS.

For AWS, you'll need a key pair in order to SSH into your server. Currently terraform does not support creating a key pair, so go to the EC2 section of the AWS console and click "Key Pairs" in the left navigation pane in order to create one.

### Usage
Once you've cloned this repo, `cd` to the directory and type `terraform get` to get the module properly installed. In `main.tf`, give the name of your key and the full path to its location. Change the region, if needed. Currently, only AMIs for us-east-1 and us-west-2 are supported. Once you have terraform installed, simply type `terraform apply`. You'll see all of the AWS resources being created. Once terraform is done creating your resources, you can type `terraform output -module=aws server_address` to get the URL for your new server. In order to connect, use
`ssh -i ubuntu@<output from server_address>`

From here, follow the lessons on http://course.fast.ai. Happy learning!
