module Etl
  module WorkflowTemplates
    module CsvSoda2IntoAnalyticsDb
      module_function

      # https://github.com/thbar/kiba/wiki/How-to-define-ETL-jobs-with-Kiba
      def setup(config)
        Kiba.parse do
          source Tasks::Sources::CsvSoda2Source, **config[:source_config]

          transform Tasks::Transforms::AnalyticsDb::FilterExistingRecordsTransform, **config[:transform_config]

          destination Tasks::Destinations::AnalyticsDb::TableDestination, **config[:destination_config]
        end
      end
    end
  end
end