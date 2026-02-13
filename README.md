# nyc_open_data

The purpose of this project is to empower you to
- create your own copy of NYC Open Data
- create and share ETL workflows with the NYC civic tech community
- explore NYC Open Data and your ETL output with open source BI solutions

## Overview

The project is a Ruby on Rails app with a Postgres database.

Each dataset is represented as an ActiveRecord model.

Create the database.

```
bundle exec rake db:create
```

Run migrations.

```
bundle exec rake db:migrate
```

Import a dataset.

```
DepartmentOfTransportation::BicycleCounter.import
```

You now have your own copy of the bicycle counter dataset!

## Local Setup

The [local setup guide](docs/LOCAL_SETUP.md) provides instructions on how to run the rails app locally.

## Core Concepts

The [core concepts document](docs/CORE_CONCEPTS.md) details the main technologies we are leveraging.

## Create Your Own Copy of NYC Open Data

The [nyc open data document](docs/YOUR_NYC_OPEN_DATA.md) explains how to pull datasets from the NYC Open Data Portal and into your own Postgres instance.

## Create and Share ETL Workflows with the NYC Civic Tech Community

The [etl document](docs/ETL.md) explains how to transform open data and store the results in your own Postgres instance.

## Explore NYC Open Data and Your ETL Output with Open Source BI Solutions

The [bi document](docs/BI.md) explains how to use Apache Superset to explore your copy of NYC Open Data.

More bi solutions coming soon.

## Production Deployments

The [production deployments document](docs/PRODUCTION_DEPLOYMENTS.md) explains how to deploy the rails app to Heroku.

More platforms coming soon.

## Contributing

TODO