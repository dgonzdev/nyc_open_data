require 'csv'

module Etl
  module Destinations
    class BicycleCounterPrimaryDb
      def write(row)
    #     @csv ||= CSV.open(output_file, 'w')
    #     unless @headers_written
    #       @headers_written = true
    #       @csv << row.keys
    #     end
    #     @csv << row.values

        next if ::DepartmentOfTransportation::BicycleCounter.find_by(original_id: original_id).present?

        BicycleCounter.create!(
          original_id: row[:original_id],
          name: row[:name],
          domain: row[:domain],
          latitude: row[:latitude],
          longitude: row[:longitude],
          interval: row[:interval],
          timezone: row[:timezone],
          sens: row[:sens],
          counter: row[:counter]
        )
      rescue => ActiveRecord::RecordNotUnique
        Rails.logger.info("Bicycle Counter. ")
      end
    end
  end
end