module Etl
  module Workflows
    module CsvSoda2IntoPrimaryDbWorkflow
      module_function

      # https://github.com/thbar/kiba/wiki/How-to-define-ETL-jobs-with-Kiba
      def setup(config)
        Kiba.parse do
          source Tasks::Sources::CsvSoda2Source, **config[:source_config]

          transform Tasks::Transforms::PrimaryDb::FilterExistingRecordsTransform, **config[:transform_config]

          destination Tasks::Destinations::PrimaryDb::TableDestination, **config[:destination_config]
        end
      end
    end
  end
end