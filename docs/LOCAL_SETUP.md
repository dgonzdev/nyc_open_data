# Local Setup

## Dependencies

### Docker

Please follow VSCode's instructions for installing Docker, https://code.visualstudio.com/docs/devcontainers/containers#_installation.

Then create a file named web-variables.env in the root folder of this project.

Note: VSCode is not required for developing this application.

### Socrata

Please follow Socrata's instructions for creating an API KEY https://support.socrata.com/hc/en-us/articles/210138558-Generating-App-Tokens-and-API-Keys.

Set the api key id and secret in the web-variables.env file like so

```
SOCRATA_API_KEY_ID=<id>
SOCRATA_API_KEY_SECRET=<secret>
```

## Build

Build the docker containers.

```
docker-compose build web
```

## Console

Access the rails console.

```
docker-compose run web bundle exec rails c
```

## Create the Databases

Create the primary and analytics databases.

```
docker-compose run web bundle exec rake db:create
```

## Create Database Tables - Primary DB

Create a new table in the primary database.

```
docker-compose run web bundle exec rails g migration <Migration Name>
```

```
docker-compose run web bundle exec rake db:migrate
```

Remember to create a corresponding Rails model.

## Create Database Tables - Analytics DB

Create a new table in the analytics database.

```
docker-compose run web bundle exec rails g migration <Migration Name> --database analytics
```

```
docker-compose run web bundle exec rake db:migrate:analytics
```

Remember to create a corresponding Rails model in app/models/analytics/.

## Import Data into the Primary DB

TODO

## Import Data into the Primary DB with Kiba

TODO

## Run ETL Workflows

TODO

## Gotchas

### Permission Denied

Permission errors may appear because files are created in a docker container but accessed from outside the container.

Change the permission levels on the file to resolve these issues.

```
sudo chmod <***> <filename>
```

https://en.wikipedia.org/wiki/Chmod