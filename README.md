# ELK-Stack-Project
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

Elk-Stack-Project/Diagrams/ElkStackDiagram.png

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the install-elk.yml file may be used to install only certain pieces of it, such as Filebeat.

  ---
- name: Configure Elk VM with Docker
  hosts: elk
  remote_user: sysadmin
  become: true
  tasks:
    # Use apt module
  - name: Install docker.io
    apt:
      force_apt_get: yes
      name: docker.io
      state: present

    # Use apt module
  - name: Install pip3
    apt:
      force_apt_get: yes
      name: python3-pip
      state: present

    # Use pip module
  - name: Install Docker python module
    pip:
      name: docker
      state: present

    # Use command module
  - name: Increase virtual memory
    command: sysctl -w vm.max_map_count=262144

    # Use shell module
  - name: Increase virtual memory on restart
    shell: echo "vm.max_map_count=262144" >> /etc/sysctl.conf

    # Use docker_container module
  - name: download and launch a docker elk container
    docker_container:
      name: elk
      image: sebp/elk:761
      state: started
      restart_policy: always
      published_ports:
        - 5601:5601
        - 9200:9200
        - 5044:5044

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available and reliable, in addition to restricting traffic to the network.
- _TODO: What aspect of security do load balancers protect? What is the advantage of a jump box?_

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the _____ and system _____.
- _TODO: What does Filebeat watch for?_
- _TODO: What does Metricbeat record?_

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name      | Function | IP Address | Operating System |
|-----------|----------|------------|------------------|
| Jump Box  | Gateway  | 10.0.0.4   | Linux            |
| Web 1     |          | 10.0.0.5   |                  |
| TODO      |          | 10.0.0.6   |                  |
| ELK-Server|          | 10.1.0.6   |                  |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box Provisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- My externally facing IP address 

Machines within the network can only be accessed by Jumpbox Provisioner machine with IP address 10.0.0.4
- Jump-Box-Provisioner with IP address 10.0.0.4

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 | Public IP/10.0.0.4   |
|  Web 1   | No                  | 10.0.0.5             |
|  Web 2   | No                  | 10.0.0.6             |
|  Web 3   | No                  | 10.0.0.7             |
### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- What is the main advantage of automating configuration with Ansible?
Automating configuration with Ansible prevents having to manually configure each step 

The playbook implements the following tasks:
- Increase the virtual memory on the VM by running: sysctl -w vm.max_map_count=262144
- Install docker.io
- Install python3-pip
- Install docker, which is the Docker Python pip module

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.
https://drive.google.com/file/d/1hz2Ln8rRByf0--Oz8-PZBVW9fxFoKlWM/view?usp=sharing

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web 1, Web 2, and Web 3

We have installed the following Beats on these machines:
- filebeats, packetbeat

These Beats allow us to collect the following information from each machine:
- _filebeats collects data about files 

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the id_rsa.pub file to SSH Public Key.
- Update the hosts file to include webservers IP addresses and root user as sysadmin.
- Run the playbook, and navigate to ELK Server to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- install-elk.yml is the playbook that we copy it into /etc/ansible/.
- To make Ansible run the playbook on a specific machine, we would have to update the ansible.cfg file. How do I specify which machine to install the ELK server on versus which to install Filebeat on?
- _Which URL do you navigate to in order to check that the ELK server is running? http://
10.1.0.6:5601/app/kibana

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
