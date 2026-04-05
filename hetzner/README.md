> [!IMPORTANT]
> It is only for Hetzners RRSets in the cloud console

# Hetzner DynDNS (A-Records) based on a bash script.
The script uses the cloud API to update a RRSet. You can use different flags for different records (subdomains)
This script uses the zoneID not the zone name.
It´s easy to use and setting up the script should function by following the Readme.


Requirements: `curl`, `git`

## Installation
```ini
git clone https://github.com/mabe1489/Hetzner-DynDNS-RRSet.git
cd Hetzner-DynDNS-RRSet/ 
```

## Configuration 

### Script Configuration
> [!IMPORTANT]
> You need your ZoneID and your API-Token

You need an API Token: Your project > security > API-Tokens > Create one with read and write access.

You need your zoneID: run the zoneID script: `bash ./zoneID.sh -t YOUR_API-TOKEN`.

Now save your zoneID in the ddns.sh in ZONE_ID and also enter your API-Token in API-TOKEN.

> [!IMPORTANT]
> You have to use the zoneID wich is the highest result of the `zoneID.sh`

With the flag `-n` you can enter your record name.

### Preconfiguration
After that installing a cronjob with:
```crontab
crontab -e
*/10 * * * *  bash YourFolder/ddns.sh -n Your-Record-Name 
```

## Thank you
Have fun and send issues in the issue tab (That would be really nice)