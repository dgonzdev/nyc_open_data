require 'open-uri'
require 'csv'

module DepartmentOfTransportation
  class BicycleCounter < ApplicationRecord
    self.table_name = :bicycle_counters

    CSV_SODA2_API_ENDPOINT = "https://data.cityofnewyork.us/resource/smn3-rzf9.csv"

    def self.download_csv_with_soda2
      URI.open(CSV_SODA2_API_ENDPOINT) do |f|
        f.each_line.each_with_index do |line, index|
          next if index == 0

          data = CSV.parse_line(line)

          original_id = data[0]
          name = data[1]
          domain = data[2]
          latitude = data[3]
          longitude = data[4]
          interval = data[5]
          timezone = data[6]
          sens = data[7]
          counter = data[8]

          next if BicycleCounter.find_by(original_id: original_id).present?

          BicycleCounter.create!(
            original_id: original_id,
            name: name,
            domain: domain,
            latitude: latitude,
            longitude: longitude,
            interval: interval,
            timezone: timezone,
            sens: sens,
            counter: counter
          )
        end
      end
    end

    def name
      "Bicycle Counters"
    end

    def description
      "Bicycle counts conducted around New York City at key locations. For the counts data, please refer to the Bicycle Counts dataset. Bicycle Counts: https://data.cityofnewyork.us/Transportation/Bicycle-Counts/uczf-rk3c"
    end

    def data_provided_by
      "Department of Transportation (DOT)"
    end

    # Dataset Information
    def agency
      "Department of Transportation (DOT)"
    end

    # Update
    def update_frequency
      "Daily"
    end

    def automation
      "Yes"
    end

    def date_made_public
      "12/31/2019"
    end

    # Topics
    def category
      "Transportation"
    end

    def tags
      "bicycle, count, eco-counter, bike"
    end
  end
end


