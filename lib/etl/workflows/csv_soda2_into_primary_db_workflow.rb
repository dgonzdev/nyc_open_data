module Etl
  module Workflows
    module CsvSoda2IntoPrimaryDbWorkflow
      module_function

      # https://github.com/thbar/kiba/wiki/How-to-define-ETL-jobs-with-Kiba
      def setup(config = {})
        Kiba.parse do
          source Sources::CsvSoda2Source, ::DepartmentOfTransportation::BicycleCounter::CSV_SODA2_API_ENDPOINT

          transform Transforms::PrimaryDb::FilterExistingRecordsTransform, DepartmentOfTransportation::BicycleCounter

          destination Destinations::PrimaryDb::TableDestination, DepartmentOfTransportation::BicycleCounter
        end
      end
    end
  end
end