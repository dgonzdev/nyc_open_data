# Your NYC Open Data

Create your own copy of NYC Open Data with Ruby on Rails and Postgres.

Each dataset is represented as an ActiveRecord model/Postgres table.

## Dataset Import

The models contain the following class methods to pull a dataset from the NYC Open Data portal and into your Postgres instance.

### import

The import method supports pulling datasets with Socrata's SODA2 and SODA3 APIs.

The datasets can be requested as either json or csv files.

#### SODA2

JSON:
```
DepartmentOfTransportation::BicycleCounter.import(api_version: '2', content_type: 'json')
```

CSV:
```
DepartmentOfTransportation::BicycleCounter.import(api_version: '2', content_type: 'csv')
```

#### SODA3

JSON:
```
DepartmentOfTransportation::BicycleCounter.import(api_version: '3', content_type: 'json')
```

CSV:
```
DepartmentOfTransportation::BicycleCounter.import(api_version: '3', content_type: 'csv')
```

### run_import

The run_import method provides the same functionality as the import method.

It was implemented to demonstrate how to use the Kiba library to define/run ETL workflows.

#### SODA2

JSON:
```
DepartmentOfTransportation::BicycleCounter.run_import(api_version: '2', content_type: 'json')
```

CSV:
```
DepartmentOfTransportation::BicycleCounter.run_import(api_version: '2', content_type: 'csv')
```

#### SODA3

JSON:
```
DepartmentOfTransportation::BicycleCounter.run_import(api_version: '3', content_type: 'json')
```

CSV:
```
DepartmentOfTransportation::BicycleCounter.run_import(api_version: '3', content_type: 'csv')
```

## Dataset Properties

The models contain the following class methods to describe a dataset's properties.

### url
```
DepartmentOfTransportation::BicycleCounter.url
```

### name
```
DepartmentOfTransportation::BicycleCounter.name
```