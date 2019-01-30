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
* Check out all the tabs and get yourself oriented with:
    * Orgs/Spaces
        * What quotas are set for you?
    * Apps
        * Scale up and down manually
        * Check the health response of each node
    * Services
        * Bind/Unbind services from the marketplace
    * Routes
        * Add a blue and green version
    * Logs
        * Adjust log level on the fly
    * Trace
        * See centralized http tracing 
    * Settings
        * Check your git/build version info
        * Check the `Environment Variables` section to see how the platform injects configuration into you app
    * PCF Metrics
        * See centralized metrics against that correlate to your logs
        * Isolate your view per instance or for the cluster