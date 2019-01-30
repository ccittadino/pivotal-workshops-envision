# pivotal-workshops-dish

## Log into GCP
* Go to https://console.cloud.google.com
* Log in with your google/gmail account
---
## Set up your Cloud Shell
* Ensure you have selected the 'FE-ccittadino' project (see top left)
* Open the Cloud Shell (see top right)
* Install the cf cli
    ```
    git clone https://github.com/ccittadino/pivotal-workshops-envision.git
    source pivotal-workshops-envision/bootstrap-gcp.sh
    ```
* Log into PCF using the account given to you by your instructor
    ```
    cf login -a api.sys.pas.warroyo.com --skip-ssl-validation
    ```
---
## Push an app
* Pull down the following sample code
    ```
    git clone https://github.com/SteeltoeOSS/Samples.git
    ```
* Build it
    ```
    cd Samples/Management/src/AspDotNetCore/CloudFoundry
    dotnet publish -f netcoreapp2.1 -r ubuntu.14.04-x64
    ```
* Create a database in the cloud
    ```
    cf create-service p.mysql db-small [YOUR NAME]MySqlService 
    ```
    * Note: Takes ~5min
* Set up your manifest.yml 
    * replace 'name' with '[YOUR NAME]-sample1' ex: ccittadino-sample1
    * replace 'myMySqlService' with '[YOUR NAME]MySqlService ' ex: ccittadinoMySqlService
* Push your app to the cloud!
    ```
    cf push -f manifest.yml -p bin/Debug/netcoreapp2.1/ubuntu.14.04-x64/publish
    ```
---
## Kick the tires
### Check out all the tabs in appsman and get yourself oriented:
* Orgs/Spaces
    * What quotas are set for you?
* Apps
    * Scale up and down manually
* Services
    * Bind/Unbind additional services from the marketplace
        * Note: you do not have to use them to bind them    
* Routes
    * Add a blue and green version
* Match the following actuator endpoints provided by your app with the UI in appsman:

    Endpoint | Description
    ---|------------
    health | Customizable endpoint that reports application health information
    info | Customizable endpoint that reports arbitrary application information (such as Git Build info and other details)
    loggers | Allows remote access and modification of logging levels in a .NET application
    trace | Reports a configurable set of trace information (such as the last 100 HTTP requests)
    refresh | Triggers the application configuration to be reloaded
    env | Reports the keys and values from the applications configuration
    mappings | Reports the configured ASP.NET routes and route templates
    metrics | Reports the collected metrics for the application
