# ETL

Transform open data with Kiba, a data processing & ETL framework for Ruby.

## Kiba

Kiba provides a DSL for defining ETL jobs.

The DSL describes
- where to pull data from aka **sources**
- how to transform it aka **transformations**
- where to store the results aka **destinations**

This project's Kiba jobs primarily write to the analytics database with one exception: the Kiba jobs that pull data from the NYC Open Data Portal and store an exact copy in the primary database.

### Workflows

This project refers to Kiba jobs as workflows.

They define the steps in an ETL process.

They live in

```
lib/etl/workflows/
```

### Workflow Templates

Workflow templates are configurable workflows.

They live in

```
lib/etl/workflow_templates/
```

### Sources

Sources are sources of data.

They live in

```
lib/etl/tasks/sources/
```

### Transformations

Transformations are operations to perform on individual entries in a dataset.

They live in

```
lib/etl/tasks/transformations/
```

### Destinations

Destinations are
- the tables in the analytics database where we store the results of a single or series of transformation(s)
- the tables in the primary database where we store the exact copies of the datasets from the NYC Open Data Portal

They live in

```
lib/etl/tasks/destinations/
```

See [local setup guide](docs/LOCAL_SETUP.md) for information on how to create tables in the analytics and primary databases.

### Runners

Workflows define the series of steps in an ETL process.

In order to actually run the workflow, the definition needs to be instantiated and called.

Kiba provides two apis to accomplish this:
- Kiba.parse instantiates an object representing the workflow
- Kiba.run takes that object as an argument and uses it to invoke the actual workflow

Runners are classes that encapsulate the instantiaion and invocation of a workflow.

They live in

```
lib/etl/runners/
```

The runners that pull data from the NYC Open Data Portal and store an exact copy in the primary database live in

```
lib/etl/runners/primary_db_imports/
```