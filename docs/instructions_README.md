# How to Install Locatable onto your TCNJ student accounts in the VM 

***

#### Create a folder to clone repository into

1) mkdir <folder_name>
2) cd <folder_name>
  
## How to set up the path to the needed github branch:
1) 'git init'
2) 'git remote add origin https://github.com/nallurn1/Assignment_2_Locatable.git'
3) 'git fetch'
4) 'git branch -av' (this lists remote branch names)
5) 'git checkout origin <branchname>'
  
#### Clone the Repository: Locatable Main Branch
'git clone https://github.com/nallurn1/Assignment_2_Locatable.git'
     

#### Run the installruby.sh script to test if you have the right version of ruby and rails running on the server
1) ./installruby.sh

#### To check your version rails and ruby using `rails -v` or `rails --version`.
1) ruby -v
   * Ruby (3.0.2) 

2) rails -v 
   * Rails (7.0.2.3)
    
***
Create an SSH key or generate a github token to allow for authentication needed when using the git commands
* For more information of the SSH key process: [Setting up SSH keys with GitHub](Setting_up_SSH_keys_GitHub.md).
***
   
   
#### Installing dependencies
Go to the `<repo_name>/src/` folder within your cloned repository. This folder has all the ocde files, and all the dependencies must be installed here. Please run the following commands. 

1) 'bundle install'
2) 'yarn install'
3) 'rails webpacker:install'
  
#### If you face any issues with the `bundle install` command please check the instructions: [Installation Guide](docs/Installation_Guide.md)

#### Commands to set up the database:
   1) 'rails db:create'
   2) 'rails db:migrate:reset'
   3) 'rails db:migrate'
   4) 'rails db:seed'


### Locatable can now be ran using the following commands within the `src` folder of the cloned repository
1)`ip addr show eth0`
  
2) `rails s (or rails server) --binding xxx.xxx.xxx.xxx`
  
3) The app should be available in the browser at http://csc415-serverXX.hpc.tcnj.edu:3000/ (XX is your server number)


### Setting up the Correct Database
* You can view the database information at http://csc415-serverXX.hpc.tcnj.edu/phpPgAdmin/

Locatable should now be installed! 
Please read through [this page](More_helpful_info.md) to view the gems that are already included to better understand the current project capabilities such as a premade login/registration functionality and an administrative portal.
