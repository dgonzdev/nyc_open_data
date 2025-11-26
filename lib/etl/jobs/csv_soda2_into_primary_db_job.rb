module Etl
  module Jobs
    module CsvSoda2IntoPrimaryDbJob
      module_function

      # https://github.com/thbar/kiba/wiki/How-to-define-ETL-jobs-with-Kiba
      def setup(config = {})
        Kiba.parse do
          source Sources::CsvSoda2Source, ::DepartmentOfTransportation::BicycleCounter::CSV_SODA2_API_ENDPOINT

          transform Transforms::PrimaryDb::FilterExistingRecordsTransform, DepartmentOfTransportation::BicycleCounter

          destination Destinations::BicycleCounterPrimaryDb
        end
      end
    end
  end
end