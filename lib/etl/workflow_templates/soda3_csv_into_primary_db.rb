module Etl
  module WorkflowTemplates
    module Soda3CsvIntoPrimaryDb
      module_function

      # https://github.com/thbar/kiba/wiki/How-to-define-ETL-jobs-with-Kiba
      def setup(config)
        Kiba.parse do
          source Tasks::Sources::Soda3CsvSource, **config[:source_config]

          transform Tasks::Transforms::PrimaryDb::FilterExistingRecordsTransform, **config[:transform_config]

          destination Tasks::Destinations::PrimaryDb::TableDestination, **config[:destination_config]
        end
      end
    end
  end
end