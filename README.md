# DNCS-LAB

This repository contains the Vagrant files required to run the virtual lab environment used in the DNCS course.
```


        +-----------------------------------------------------+
        |                                                     |
        |                                                     |enp0s3
        +--+--+                +------------+             +------------+
        |     |                |            |             |            |
        |     |         enp0s3 |       10.0.8.1/30   10.0.8.2/30       |
        |     +----------------+  router-1  +-------------+  router-2  |
        |     |                |            |enp0s9 enp0s9|            |
        |     |                |            |             |            |
        |  M  |                +------------+             +------------+
        |  A  |          10.0.0.1/23 | 10.0.0.1/23               |10.0.6.1/23
        |  N  |                      |enp0s8                     |enp0s8
        |  A  |                      |                           |
        |  G  |                      |                     +-----+----+
        |  E  |                      |enp0s8               |          |
        |  M  |            +-------------------+           |          |
        |  E  |     enp0s3 |                   |           |  host-c  |
        |  N  +------------+      SWITCH       |           |          |
        |  T  |            |                   |           |          |
        |     |            +-------------------+           +----------+
        |  V  |               |enp0s9       |enp0s10             |enp0s3
        |  A  |               |             |                    |
        |  G  |               |             |                    |
        |  R  |               |enp0s8       |enp0s8              |
        |  A  |        +----------+     +----------+             |
        |  N  |        |          |     |          |             |
        |  T  |  enp0s3|          |     |          |             |
        |     +--------+  host-a  |     |  host-b  |             |
        |     |        |          |     |          |             |
        |     |        |          |     |          |             |
        ++-+--+        +----------+     +----------+             |
        | |             10.0.0.2/23      |10.0.4.2/23            |
        | |                              |enp0s3                 |
        | +------------------------------+                       |
        |                                                        |
        |                                                        |
        +--------------------------------------------------------+



```

# Requirements
 - Python 3
 - 10GB disk storage
 - 2GB free RAM
 - Virtualbox
 - Vagrant (https://www.vagrantup.com)
 - Internet

# How-to
 - Install Virtualbox and Vagrant
 - Clone this repository
`git clone https://github.com/dustnic/dncs-lab`
 - You should be able to launch the lab from within the cloned repo folder.
```
cd dncs-lab
[~/dncs-lab] vagrant up
```
Once you launch the vagrant script, it may take a while for the entire topology to become available.
 - Verify the status of the 4 VMs
 ```
 [dncs-lab]$ vagrant status                                                                                                                                                                
Current machine states:

router                    running (virtualbox)
switch                    running (virtualbox)
host-a                    running (virtualbox)
host-b                    running (virtualbox)
```
- Once all the VMs are running verify you can log into all of them:
`vagrant ssh router`
`vagrant ssh switch`
`vagrant ssh host-a`
`vagrant ssh host-b`
`vagrant ssh host-c`

# Assignment
This section describes the assignment, its requirements and the tasks the student has to complete.
The assignment consists in a simple piece of design work that students have to carry out to satisfy the requirements described below.
The assignment deliverable consists of a Github repository containing:
- the code necessary for the infrastructure to be replicated and instantiated
- an updated README.md file where design decisions and experimental results are illustrated
- an updated answers.yml file containing the details of 

## Design Requirements
- Hosts 1-a and 1-b are in two subnets (*Hosts-A* and *Hosts-B*) that must be able to scale up to respectively 497 and 426 usable addresses
- Host 2-c is in a subnet (*Hub*) that needs to accommodate up to 497 usable addresses
- Host 2-c must run a docker image (dustnic82/nginx-test) which implements a web-server that must be reachable from Host-1-a and Host-1-b
- No dynamic routing can be used
- Routes must be as generic as possible
- The lab setup must be portable and executed just by launching the `vagrant up` command

## Tasks
- Fork the Github repository: https://github.com/dustnic/dncs-lab
- Clone the repository
- Run the initiator script (dncs-init). The script generates a custom `answers.yml` file and updates the Readme.md file with specific details automatically generated by the script itself.
  This can be done just once in case the work is being carried out by a group of (<=2) engineers, using the name of the 'squad lead'. 
- Implement the design by integrating the necessary commands into the VM startup scripts (create more if necessary)
- Modify the Vagrantfile (if necessary)
- Document the design by expanding this readme file
- Fill the `answers.yml` file where required (make sure that is committed and pushed to your repository)
- Commit the changes and push to your own repository
- Notify the examiner that work is complete specifying the Github repository, First Name, Last Name and Matriculation number. This needs to happen at least 7 days prior an exam registration date.

# Notes and References
- https://rogerdudler.github.io/git-guide/
- http://therandomsecurityguy.com/openvswitch-cheat-sheet/
- https://www.cyberciti.biz/faq/howto-linux-configuring-default-route-with-ipcommand/
- https://www.vagrantup.com/intro/getting-started/


# Design
Al fine di raggiungere i requisiti richiesti, nel progetto sono stati impegati i seguenti intervalli di indirizzi:
- host 1-a:	sfrutta indirizzi appartenenti alla sottorete 10.0.0.0/23, in particolare da 10.0.0.2 a 10.0.1.254 sull'interfaccia enp0s8.

- host 1-b:     sfrutta indirizzi appartenenti alla sottorete 10.0.4.0/23, in particolare da 10.0.4.2 a 10.0.5.254 sull'interfaccia enp0s8.

- host 2-c:     sfrutta indirizzi appartenenti alla sottorete 10.0.6.0/23, in particolare da 10.0.6.2 a 10.0.7.254 sull'interfaccia enp0s8.

- router-1:	sfrutta l'indirizzo 10.0.0.1/23 appartenente alla sottorete 10.0.0.0/23 sull'interfaccia enp0s8.
		sfrutta l'indirizzo 10.0.4.1/23 appartenente alla sottorete 10.0.4.0/23 sull'interfaccia enp0s8.
		sfrutta l'indirizzo 10.0.8.1/30 appartenente alla sottorete 10.0.8.0/30 sull'interfaccia enp0s9.

- router-2:     sfrutta l'indirizzo 10.0.8.2/30 appartenente alla sottorete 10.0.8.0/30 sull'interfaccia enp0s9.
                sfrutta l'indirizzo 10.0.6.1/23 appartenente alla sottorete 10.0.6.0/23 sull'interfaccia enp0s8.

Lo switch è connesso ai dispositivi tramite il seguente schema:

	- host 1-a sull' interfaccia enp0s9.
	- host 1-b sull'interfaccia enp0s10.
	- router-1 sul'interfaccia enp0s8.


