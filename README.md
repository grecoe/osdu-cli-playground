# osdu-cli-playground

Playing with the open source cli for OSDU platform

[The open source project](https://community.opengroup.org/osdu/platform/data-flow/data-loading/osdu-cli) for the osdu-cli contains the code for the project. It is also a [pip installable](https://pypi.org/project/osducli/) package. 

This repo will walk you through using a [conda](https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html) environment to install and play with the package. 

The cli package is developed by Equinor, which is called out on the pypi page. 


<b>Steps</b>
- [Create your environment](#create-your-environment)
- [Configure osdu-cli](#configure-osdu-cli)
    - [Configuration Details](#configuration-details)
- [Testing odsu-cli](#testing-odsu-cli)


## Create your environment

> conda env create -f environment.yml
> conda activate OsduCli

Once the environment is created and activated, <b>osdu</b> is a command line tool, you can check the version with:

> osdu version

## Configure osdu-cli

In the osdu-cli, documents say to configure the tool but don't give any information how that is going to happen, or what is actually stored. You can figure out where it keeps it's configuration by entering the command:

> osdu config default

Which will, on Windows, indicate it is here:

> C:\Users\[USER]\.osducli\config

Now run the following command:

> osdu config update 

### Configuration Details

> <b>STOP:</b> You will first need a refresh token for your OSDU instance. Do do so, [follow the instructions here!](./token/Readme.md)


- OSDU API server - the URL of your OSDU instance, for example :
    - https://platform1000.energy.azure.com
- Then there is a list of paths it's looking for, just hit enter to accept the default. Stop when it asks about the data partition name. 
- Data partition name, type in the partition name if it is not opendes, typically it will be something like "platform1000-opendes"
- Legal tag, not sure if the one they are suggesting is always there by default. 
    - By default they put in opendes-public-usa-dataset-7643990, but likely is NOT one on your OSDU system, so you will need to find one in your system for this. 
- ACL Viewers and Owners, by default they have data.default.viewers@opendes.contoso.com, but you should change 'opendes' to your data partition name. 
- Set up authentication to the OSDU platform using a refresh token. This will be copied from executing the [scripts to create a token](./token/Readme.md) . 
    - You will also need information from running that token script anyway.
        - Token Endpoint:
            - https://login.microsoftonline.com/YOUR_TENANT/oauth2/v2.0/token
        - Client id and secret (Service Principal and Credential)



## Testing odsu-cli
If your configuration is correct, you shoud be able to run in your conda environment the osdu tool. You can test it with the following command:

> osdu status