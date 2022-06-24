# osdu-cli-playground

Playing with the open source cli for OSDU platform

[Th open source project](https://community.opengroup.org/osdu/platform/data-flow/data-loading/osdu-cli) for the osdu-cli contains the code for the project. It is also a [pip installable](https://pypi.org/project/osducli/) package. 

This repo will walk you through using a [conda](https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html) environment to install and play with the package. 

The cli package is developed by Equinor, which is called out on the pypi page. 

## Create your environment

> conda env create -f environment.yml
> conda activate OsduCli

Once the environment is created and activated, <b>osdu</b> is a command line tool, you can check the version with:

> osdu version

## Setting up your configuration

In the osdu-cli, documents say to configure the tool but don't give any information how that is going to happen, or what is actually stored. You can figure out where it keeps it's configuration by entering the command:

> osdu config default

Which will, on Windows, indicate it is here:

> C:\Users\[USER]\.osducli\config

Now run the following command:

> osdu config update 

### Order of information
- OSDU API server - the URL of your OSDU instance
- Then there is a list of paths it's looking for, just hit enter to accept the default. Stop when it asks about the data partition name. 
- Data partition name, type in the partition name if it is not opendes
- Legal tag, not sure if the one they are suggesting is always there by default. 
    - By default they put in opendes-public-usa-dataset-7643990, but likely is NOT one on your OSDU system, so you will need to find one in your system for this. 
- ACL Viewers and Owners, by default they have data.default.viewers@opendes.contoso.com, but you should change 'opendes' to your data partition name. 
- Set up authentication to the OSDU platform. 
    1. Using a refresh token, which from your deployment you will need. 
        - Auth token endpont (URL EPL Site)
        - Refresh Token (pre retreived token)
        - Client id and secret (Service Principal and Credential)
    2. msal, asks a bunch of questions about the authority, scope, client id. Not sure what those are. 

