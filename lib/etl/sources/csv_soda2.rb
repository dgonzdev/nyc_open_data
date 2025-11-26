require 'open-uri'
require 'csv'

module Etl
  module Sources
    class CsvSoda2
      def each
        CSV.new(
          URI.open(::DepartmentOfTransportation::BicycleCounter::CSV_SODA2_API_ENDPOINT),
          headers: true,
          header_converters: :symbol
        ).each do |row|
          yield(row.to_hash)
        end
      end
    end
  end
end