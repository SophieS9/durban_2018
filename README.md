# Workshop on Microbiome and Transcriptome Analysis, Durban, South Africa
Instructions and notes for creating the AMI for the [Workshop on Microbiome and Transcriptome Analysis](http://evomics.org/workshops/2019-workshop-on-microbiome-and-transcriptome-analysis-south-africa/). 

This repository is a direct copy from Guy Leonard's Evomics 2017 repository (https://github.com/guyleonard/evomics_2017) and all credit for everything here should be given to him. I have modified the scripts for my own use with this AMI. Please refer to his repo for more details of the base AMI and what the ansible scripts are doing...

Install notes for additional software added for Durban 2018 can be found in [install_notes.md](./install_notes.md) 

# Base Image
TO UPDATE
We will be using the latest Ubuntu Linux as our initial AMI, in this case: [ami-cf68e0d8](https://console.aws.amazon.com/ec2/home?region=us-east-1#LaunchInstanceWizard:ami=ami-cf68e0d8) which is the 'us-east-1'	copy of Ubuntu Xenial Xerus 16.04 LTS. But you should be able to use any Debian based version of Linux, ansible will stop on errors but it can also be resumed from that point. I am assuming that you have an AWS account and have already initialised the above AMI for this README.

## Base AMI Setup

Log in to your virtual machine and run this code:

    wget -O- https://raw.githubusercontent.com/SophieS9/durban_2018/master/setup.sh | bash

Typically, I would now make an [Amazon Machine Image](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/creating-an-ami-ebs.html) of this system and then use that as your "base AMI" for the next steps (this will save time if you run in to any issues).

If you already have a base AMI that you wish to use you can do this instead:

    git clone https://github.com/SophieS9/durban_2018.git
    ansible-playbook /home/ubuntu/durban_2018/base/main.yaml -b -K -c local -i "localhost,"

## NB

If you are logged in to your AMI using a key pair then you do not need to enter a password when you are asked for SUDO access. Just press 'enter' and continue.

## AMI Setup:

### Software

Run the genomics software playbook fully:

    ANSIBLE_NOCOWS=1 ansible-playbook /home/ubuntu/durban_2018/genomics/main_software.yaml -b -K -c local -i "localhost,"

or for just two tools, e.g. samtools & bwa:

    ANSIBLE_NOCOWS=1 ansible-playbook /home/ubuntu/durban_2018/genomics/main_software.yaml -b -K -c local -i "localhost," --tags samtools,bwa
    
or for just one tutorial you could do:

    ANSIBLE_NOCOWS=1 ansible-playbook /home/ubuntu/durban_2018/genomics/main_software.yaml -b -K -c local -i "localhost," --tags assembly

Tags can be mixed and matched as you like, they *should* install their dependencies where I have remembered ;).

### Data

There is only one playbook for the data section, but you can run it with tags as before.

    ANSIBLE_NOCOWS=1 ansible-playbook /home/ubuntu/durban_2018/genomics/main_data.yaml -b -K -c local -i "localhost,"

