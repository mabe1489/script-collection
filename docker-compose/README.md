## Installation
```ini

git clone https://github.com/mabe1489/compose-autostart.git
cd compose-autostart/
```

## Configuration
### Flags
`-p` Path to the docker-compose.yml
`-c` Compose Project name

### Preconfiguration
After that installing a cronjob with:
```crontab
crontab -e
*/10 * * * *  bash YourFolder/autostart.sh -p -c 
```
### Update Docker Compose projects
Use 
```file
compose-autostart/update_container.sh 
```
with the the flags above.
