# whatsapp-service-container

First of all, you need to modify .env-template and rename to .env file to custom your environment and paths to save your information.

## Usage
Execute command

docker-compose up -d

if you have a differents files for each environment, you can use --env_file [name_of_file]

Example

docker-compose --env_file .env_file_custom 

Note:
If you want to export another db, you must modify the 20-dump.whats... file in restore directory
