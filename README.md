# vagrant-multi-apache-mysql

Edited by Yu-jin Lee on 5/6/2021    
vagrant_multi_vm (main directory) : 1 DB, 1 Web server    
Vagrant_MultiServer (sub directory) : 1 DB with 2 tables, 2 Web servers(connected to each of the 2 DB tables)    

---
Edited by Hyung-Jong Kim on 4/8/2021

---
This project is a updated version of https://github.com/rankinjl/vagrant-multi-apache-mysql. 
I just updated Some php codes to show the updated data. 

Use Vagrant and VirtualBox to set up multiple VMs on a private network: one Apache WebExampleBox with a form on a web page and one MySQL DBExampleBox that receives and stores this form data.

Edited by Jessica Rankins on 4/19/2017

TO EXECUTE:
- Make sure you have a VagrantMultiAdditionalFiles folder in this directory
		that contains the form web page
- ```vagrant up``` to create both WebExampleBox (apache) and DBExampleBox (mysql)
- Should see WebExampleBox's web page in browser at 192.168.3.5
- Can ```vagrant ssh``` into either VM
		DBExampleBox default username = root, password = rootpass for mysql

GOALS:
- Use Vagrant and VirtualBox to configure multiple VMs in a single
		Vagrantfile.
- Demonstrate Infrastructure as code principles (script configures 
		and provisions environments to ensure environment parity).
- Be able to provision VMs with a script.
- Networking:
    - Forwarded ports to host from WebExampleBox: 80 to 8080 
			for apache webserver demonstration
    - Private network between boxes
- WebExampleBox: Apache web server with form
- DBExampleBox: MySQL DB holding submitted data from web server form

SOME USEFUL COMMAND LINE COMMANDS:
- ```vagrant up``` to create/start ALL BOXES corresponding to the 
  Vagrantfile in the current directory
- ```vagrant up BOXNAME``` to create/start the box corresponding to that
		BOXNAME in the Vagrantfile in the current directory
- ```vagrant reload [--provision]``` reload ALL BOXES to include new 
		Vagrantfile commands [and reload provisions]
- ```vagrant reload [--provision] BOXNAME``` reload BOXNAME to include 
		new Vagrantfile commands [and reload provisions]
- ```vagrant destroy``` shut down and deallocate resources corresponding 
		to ALL BOXES
- ```vagrant destroy BOXNAME``` shut down and deallocate resources 
		corresponding to BOXNAME 
- ```vagrant ssh BOXNAME``` start ssh session into box corresponding to 
		BOXNAME (end by typing "logout"), Uses Git, 
		private key provided by Vagrant

SOME USEFUL MYSQL COMMANDS:
- ```mysql -u username -p``` to connect to MySQL server
		(default username = root, password = rootpass)
- ```SHOW DATABASES;``` to list available databases
- ```USE databasename;``` to change databases
- ```CREATE DATABASE databasename;``` to create database 
- ```DROP DATABASE databasename;``` to delete database
- ```SHOW tables;``` to see available database tables
- ```DESCRIBE tablename;``` to see overview of table (field, type, etc)
- ```CREATE TABLE tablename (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, column1 TYPE, column2 TYPE,..., columnN TYPE);``` 
    to create a table in the current database
		- columnJ is the label of the column
		- TYPE can be things like: VARCHAR(maxnumofchars), CHAR(1),
			DATE
- ```INSERT INTO 'tablename' ('id','column1val',...,'columnNval');``` to 
		insert a row of info in the current database
- ```SELECT * FROM tablename;``` to see the info in this table
- ```DELETE from tablename where columnname=fieldtext;``` to delete a row
		in this table where the column has this value

EXECUTION OF VAGRANTFILE COMMANDS:
- "name" in "config.vm.define 'name' do |n|" is the same as the
		"config" variable.
- Commands placed inside the "config.vm.define 'name' do |n|" are
		applied only to the defined machine (name).
- Commands placed outside this command are done to all machines.
- Commands are executed outside-in, in the order listed in the
		Vagrantfile.

PORT COLLISION:
- If multiple VMs are created and one tries to connect to a port that
		another VM is connected to, Vagrant automatically reassigns
		a new port to the one not connected yet.
