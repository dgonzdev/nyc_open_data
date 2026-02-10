# Your NYC Open Data

Create your own copy of NYC Open Data with Ruby on Rails and Postgres.

Each dataset is represented as an ActiveRecord model/Postgres table.

## Dataset Import

The models contain the following class methods to pull a dataset from the NYC Open Data portal and into your Postgres instance.

### import

The import method supports pulling datasets with Socrata's SODA2 and SODA3 APIs.

The datasets can be requested as json or csv files.

#### SODA2

```
DepartmentOfTransportation::BicycleCounter.import
DepartmentOfTransportation::BicycleCounter.import(api_version: '2', content_type: 'json')
```

```
DepartmentOfTransportation::BicycleCounter.import(api_version: '2', content_type: 'csv')
```

#### SODA3

```
DepartmentOfTransportation::BicycleCounter.import(api_version: '3', content_type: 'json')
```

```
DepartmentOfTransportation::BicycleCounter.import(api_version: '3', content_type: 'csv')
```

### run_import

The run_import method provides the same functionality as the import method.

It was implemented to demonstrate how to use the Kiba library to define/run ETL workflows.

#### SODA2

```
DepartmentOfTransportation::BicycleCounter.run_import
DepartmentOfTransportation::BicycleCounter.run_import(api_version: '2', content_type: 'json')
```

```
DepartmentOfTransportation::BicycleCounter.run_import(api_version: '2', content_type: 'csv')
```

#### SODA3

```
DepartmentOfTransportation::BicycleCounter.run_import(api_version: '3', content_type: 'json')
```

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

### description
```
DepartmentOfTransportation::BicycleCounter.description
```

### data_provided_by
```
DepartmentOfTransportation::BicycleCounter.data_provided_by
```

### agency
```
DepartmentOfTransportation::BicycleCounter.agency
```

### update_frequency
```
DepartmentOfTransportation::BicycleCounter.update_frequency
```

### automation
```
DepartmentOfTransportation::BicycleCounter.automation
```

### date_made_public
```
DepartmentOfTransportation::BicycleCounter.date_made_public
```

### category
```
DepartmentOfTransportation::BicycleCounter.category
```

### tags
```
DepartmentOfTransportation::BicycleCounter.tags
```
