# Acquire Refresh Token

Prior to setting up the odsu cli, you will need to create a refresh token that the tool can accept. 

To do this you will need some information from your OSDU deployment.

You can follow the instructions [on this repository](https://github.com/azure/osdu-data-load-tno). 

There is a script in this directory to help you retrieve the access token already. 

1. Modify the varaibles on lines 3-8
2. Run the script in a bash shell
    - This will prompt you to launch your browser and collect information and add it back to the script.
3. Run the script a second time to get the refresh token. 
    - Copy the refresh token to use in setting up the OSDU cli. 