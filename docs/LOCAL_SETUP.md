# Local Setup

## Dependencies

### Docker

Follow VSCode's instructions for installing Docker, https://code.visualstudio.com/docs/devcontainers/containers#_installation.

Then create a file named web-variables.env in the root folder of this project.

Note: VSCode is not required for developing this application.

### Socrata

Follow Socrata's instructions for creating an API KEY https://support.socrata.com/hc/en-us/articles/210138558-Generating-App-Tokens-and-API-Keys.

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

## Start

Start the docker containers and rails app.

```
docker-compose up web
```

## Console

Access the rails console.

```
docker-compose run web bundle exec rails c
```

## Create the Primary Database

Create the primary database.

```
docker-compose run web bundle exec rake db:create:primary
```

The primary database is intended to be an exact copy of NYC Open Data.

## Create the Analytics Database

Create the analytics database.

```
docker-compose run web bundle exec rake db:create:analytics
```

The analytics database is intended to store your ETL output.

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

Import data into the primary database.

```
DepartmentOfTransportation::BicycleCounter.import
```

See [nyc open data](YOUR_NYC_OPEN_DATA.md) for more information.

## Run ETL Workflows

Perform transformations on open data and store the results in the analytics database.

```
Etl::Runners::BicycleCountersSoda2CsvIntoAnalyticsDb.run
```

See [etl](ETL.md) for more information.

## Gotchas

### Permission Denied

Permission errors may appear because files are created in a docker container but accessed from outside the container.

Change the permission levels on the file to resolve these issues.

```
sudo chmod <***> <filename>
```

https://en.wikipedia.org/wiki/Chmod