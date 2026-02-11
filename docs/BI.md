# BI

Explore NYC Open Data and your ETL output with open source BI solutions.

## Apache Superset

Apache Superset™ is an open-source modern data exploration and visualization platform.

Official documentation: https://superset.apache.org/docs/intro.

Source code: https://github.com/apache/superset.

### Local Setup

#### Step 1

Start the rails app.

```
docker-compose up web
```

#### Step 2

Follow Apache Superset's instructions for downloading and starting superset locally:

https://superset.apache.org/docs/quickstart/

#### Step 3

Sign into superset:

http://localhost:8088/

```
username: admin
password: admin
```

#### Step 4

Click Settings -> Databases Connections -> + Database.

Select PostgreSQL.

Run the following command to find the host:

```
ip addr show | grep docker0
```
- https://stackoverflow.com/questions/73757001/connect-superset-to-postgresql-in-a-docker-container-the-port-is-closed

Enter the following values for the remaining fields:

| Port  | Database name                | Username | Password | Display Name       |
| ----- | ---------------------------- | -------- | -------- | ------------------ |
| 5432  | nyc_open_data_development    | postgres | password | \<can be anything> |

Click connect.

You should now be able to query and build charts on top of your copy of NYC Open Data.

#### Step 5

Click Settings -> Databases Connections -> + Database.

Select PostgreSQL

Run the following command to find the host:

```
ip addr show | grep docker0
```
- https://stackoverflow.com/questions/73757001/connect-superset-to-postgresql-in-a-docker-container-the-port-is-closed

Enter the following values for the remaining fields:

| Port  | Database name                       | Username | Password | Display Name       |
| ----- | ----------------------------------- | -------- | -------- | ------------------ |
| 5432  | nyc_open_data_analytics_development | postgres | password | \<can be anything> |

Click connect.

You should now be able to query and build charts on top of your ETL output.

### Managed Solutions

#### Preset

Preset delivers open-source Apache Superset™ with a scalable, enterprise-grade hosted solution, extending it with key features and offering a broad platform that allows you to deliver modern Business Intelligence, embedded analytics, and tailored data experiences.

Website: https://preset.io/