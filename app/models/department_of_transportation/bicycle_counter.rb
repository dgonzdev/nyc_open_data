require 'remote_dataset/csv/soda2'
require 'remote_dataset/csv/soda3'

module DepartmentOfTransportation
  class BicycleCounter < ApplicationRecord
    self.table_name = :bicycle_counters

    SODA2_API_ENDPOINT = "https://data.cityofnewyork.us/resource/smn3-rzf9.json"
    SODA2_CSV_API_ENDPOINT = "https://data.cityofnewyork.us/resource/smn3-rzf9.csv"

    SODA3_API_ENDPOINT = "https://data.cityofnewyork.us/api/v3/views/smn3-rzf9/query.json"
    SODA3_CSV_API_ENDPOINT = "https://data.cityofnewyork.us/api/v3/views/smn3-rzf9/query.csv"

    def self.url
      "https://data.cityofnewyork.us/Transportation/Bicycle-Counters/smn3-rzf9/about_data"
    end

    def self.name
      "Bicycle Counters"
    end

    def self.description
      "Bicycle counts conducted around New York City at key locations. For the counts data, please refer to the Bicycle Counts dataset. Bicycle Counts: https://data.cityofnewyork.us/Transportation/Bicycle-Counts/uczf-rk3c"
    end

    def self.data_provided_by
      "Department of Transportation (DOT)"
    end

    # Dataset Information
    def self.agency
      "Department of Transportation (DOT)"
    end

    # Update
    def self.update_frequency
      "Daily"
    end

    def self.automation
      "Yes"
    end

    def self.date_made_public
      "12/31/2019"
    end

    # Topics
    def self.category
      "Transportation"
    end

    def self.tags
      "bicycle, count, eco-counter, bike"
    end

    # Import
    def self.import(api_version: '2', content_type: 'json')
      if api_version == '2' && content_type == 'json'
        import_soda2
      end

      if api_version == '2' && content_type == 'csv'
        import_soda2_csv
      end

      if api_version == '3' && content_type == 'json'
        import_soda3
      end

      if api_version == '3' && content_type == 'csv'
        import_soda3_csv
      end
    end

    def self.import_soda2
      data = RemoteDataset::Json::Soda2.new(remote_url: SODA2_API_ENDPOINT)

      data.each do |row|
        original_id = row["id"]
        name = row["name"]
        domain = row["domain"]
        latitude = row["latitude"]
        longitude = row["longitude"]
        interval = row["interval"]
        timezone = row["timezone"]
        sens = row["sens"]
        counter = row["counter"]

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
    private_class_method :import_soda2

    def self.import_soda2_csv
      csv = RemoteDataset::Csv::Soda2.new(remote_url: SODA2_CSV_API_ENDPOINT)

      csv.each do |row|
        original_id = row[0]
        name = row[1]
        domain = row[2]
        latitude = row[3]
        longitude = row[4]
        interval = row[5]
        timezone = row[6]
        sens = row[7]
        counter = row[8]

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
    private_class_method :import_soda2_csv

    def self.import_soda3
      data = RemoteDataset::Json::Soda3.new(remote_url: SODA3_API_ENDPOINT)

      data.each do |row|
        original_id = row["id"]
        name = row["name"]
        domain = row["domain"]
        latitude = row["latitude"]
        longitude = row["longitude"]
        interval = row["interval"]
        timezone = row["timezone"]
        sens = row["sens"]
        counter = row["counter"]

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
    private_class_method :import_soda3

    def self.import_soda3_csv
      csv = RemoteDataset::Csv::Soda3.new(remote_url: SODA3_CSV_API_ENDPOINT)

      csv.each do |row|
        original_id = row[0]
        name = row[1]
        domain = row[2]
        latitude = row[3]
        longitude = row[4]
        interval = row[5]
        timezone = row[6]
        sens = row[7]
        counter = row[8]

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
    private_class_method :import_soda3_csv

    def self.run_import(api_version: '2', content_type: 'json')
      if api_version == '2' && content_type == 'json'
      end

      if api_version == '2' && content_type == 'csv'
        run_import_soda2_csv
      end

      if api_version == '3' && content_type == 'json'
      end

      if api_version == '3' && content_type == 'csv'
        run_import_soda3_csv
      end
    end

    def self.run_import_soda2_csv
      Etl::Runners::BicycleCountersCsvSoda2IntoPrimaryDb.run
    end
    private_class_method :run_import_soda2_csv

    def self.run_import_soda3_csv
      Etl::Runners::BicycleCountersCsvSoda3IntoPrimaryDb.run
    end
    private_class_method :run_import_soda3_csv
  end
end
