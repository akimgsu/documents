## Log in and Switch Users

* To get information on who we are, use: whoami ; groups
* For more information on our user ID, primary group ID, and groups that we're part of, run this command: id
* To determine what files get run when we use different commands to elevate our privileges, become the root user: sudo-i
* Enter the following command to export and echo SOURCED1 into the root user's bash_profile: echo export SOURCED1=.bash_profile >> ~/.bash_profile ; echo 'echo $SOURCED1' >> ~/.bash_profile
* Make sure both lines are there: grep SOURCED .bash_profile
* Enter the following command to export and echo SOURCED2 into the root user's .bashrc: echo export SOURCED2=.bashrc >> ~/.bashrc ; echo 'echo $SOURCED2' >> ~/.bashrc
* Make sure both SOURCED lines are there: grep SOURCED .bashrc
* Kill the timeout: sudo -k
* To see the echoes, enter: sudo -i echo
* Type in the cloud_user's password to see the echoes. Set the root user's password: sudo -i passwd root
* Run the command to see the cloud_user's path: su -c 'echo $PATH'
* Run the command to sign in as the root user and show the cloud_user's path: su - -c 'echo $PATH'

Understand that sudo equals the cloud_user, but sudo -i equals the root user. Su also equals the cloud_user, while su - equals the root user.

## Access Remote Systems Using SSH

* Change the password: sudo -i passwd cloud_user
* To get some information on the remote system, query the remote system by running the following commands: top, hostname, df -hT

## Configure Key-Based Authentication for SSH

* Generate a public/private key pair using the defaults on the first cloud server: ssh-keygen
* Copy that ID to the second cloud server, also known as the remote server: ssh-copy-id <SECOND_PUBLIC_IP_ADDRESS>
* Add the cloud_user identity to the agent and to reload the agent: eval $(ssh-agent -s)

## Connect to the remote server:

* Execute a backup command on a remote system: ssh cloud_user@<SECOND_PUBLIC_IP_ADDRESS> tar -czvf wget-server2.tar.gz wget-1*.rpm
* Hit the Up arrow and perform an scp: scp cloud_user@<SECOND_PUBLIC_IP_ADDRESS>:~/wget-server2*.* .