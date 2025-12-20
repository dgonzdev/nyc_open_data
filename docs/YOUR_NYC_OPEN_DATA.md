# Your NYC Open Data

Create your own copy of NYC Open Data with Ruby on Rails and Postgres.

Each dataset is represented as an ActiveRecord model/Postgres table.

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



## Dataset Import

The models also provide methods for pulling data from the NYC Open Data portal and into Postgres.
