module Etl
  module Transforms
    module PrimaryDb
      class FilterExistingRecordsTransform
        attr_reader :model

        # https://github.com/thbar/kiba/wiki/Implementing-ETL-transforms
        def initialize
          @model = DepartmentOfTransportation::BicycleCounter
        end

        def process(row)
          model
            .find_by(original_id: row[:id])
            .blank? ? row : nil
        end
      end
    end
  end
end
