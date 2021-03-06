
# ELK-Stack-Project

## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

Elk-Stack-Project/Diagrams/ElkStackDiagram.png

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the install-elk.yml file may be used to install only certain pieces of it, such as Filebeat.

- install-elk.yml
- filebeat-playbook.yml
- filebeat-configuration.yml
- pentest.yml

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available and reliable, in addition to restricting traffic to the network.
- Load balancing protects the website and its servers, as it helps distribute traffic evenly and mitigates possible DDoS attacks. 
Additionally, using a jump box creates a secure gateway or environment for users to connect to before doing administrative tasks on the other servers or not as secure environments.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the server and system application.
- Filebeat watches for log events and log files that we have specified.
- Metricbeat collects machine metrics, which includes CPU and uptime.

The configuration details of each machine may be found below.

| Name      | Function    | IP Address | Operating System |
|-----------|-------------|------------|------------------|
| Jump Box  | Gateway     | 10.0.0.4   | Linux            |
| Web 1     |Web Server   | 10.0.0.5   | Linux            |
| Web 2     |Web Server   | 10.0.0.6   | Linux            |
| Web 3     |Web Server   | 10.0.0.7   | Linux            |
|ELK Server |ELK w/ Docker| 10.1.0.6   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box Provisioner machine can accept connections from the Internet. Access to this machine is only allowed from the the user's externally facing IP address 

Machines within the network can only be accessed by Jumpbox Provisioner machine with IP address 10.0.0.4

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 | Public IP address    |
|  Web 1   | No                  | 10.0.0.4             |
|  Web 2   | No                  | 10.0.0.6             |
|  Web 3   | No                  | 10.0.0.7             |
|ELK Server| No                  | 10.0.1.6

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because automating configuration with Ansible allows the infrastructure to run by code. This is much more efficent than having to manually configure each component one by one for various reasons.

The playbook implements the following tasks:
- Increase the virtual memory on the VM by running: sysctl -w vm.max_map_count=262144
- Install docker.io
- Install python3-pip
- Install docker, which is the Docker Python pip module

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.
https://drive.google.com/file/d/1hz2Ln8rRByf0--Oz8-PZBVW9fxFoKlWM/view?usp=sharing

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1, Web-2, and Web-3

We have installed the following Beats on these machines:
- Filebeat, Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat collects data about the filesystem through traffic. Metricbeat collects data showing machine metrics.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the id_rsa.pub file to SSH Public Key.
- Update the hosts file to include webservers IP addresses and root user as sysadmin.
- Run the playbook, and navigate to ELK Server to check that the installation worked as expected.

Note:
- install-elk.yml is the playbook that we copy it into /etc/ansible/.
- To make Ansible run the playbook on a specific machine, we would have to update the ansible.cfg file. How do I specify which machine to install the ELK server on versus which to install Filebeat on?
- In order to check that the ELK server is running, navigate to URL http://10.1.0.6:5601/app/kibana
