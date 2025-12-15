module Etl
  module WorkflowTemplates
    module Soda2CsvIntoAnalyticsDb
      module_function

      # https://github.com/thbar/kiba/wiki/How-to-define-ETL-jobs-with-Kiba
      def setup(config)
        Kiba.parse do
          source Tasks::Sources::Soda2CsvSource, **config[:source_config]

          transform Tasks::Transforms::AnalyticsDb::FilterExistingRecordsTransform, **config[:transform_config]

          destination Tasks::Destinations::AnalyticsDb::TableDestination, **config[:destination_config]
        end
      end
    end
  end
end