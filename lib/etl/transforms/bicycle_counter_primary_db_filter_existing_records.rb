module Etl
  module Transforms
    class BicycleCounterPrimaryDbFilterExistingRecords
      def process(row)
        return row if ::DepartmentOfTransportation::BicycleCounter.find_by(original_id: row[:original_id]).blank?
      end
    end
  end
end
