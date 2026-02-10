# ETL

Transform open data with Kiba, a data processing & ETL framework for Ruby.

## Kiba

Kiba provides a DSL to let you define ETL jobs that consist of
- sources
- transformations
- destinations

### Workflows

This project refers to Kib jobs as workflows.

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

Sources represent sources of data.

They live in

```
lib/etl/tasks/sources/
```

### Transformations

Transformations represent operations to perform on individual entries in a dataset.

They live in

```
lib/etl/tasks/transformations
```

### Destinations

### Runners