module PoliceDepartment
  class MotorVehicleCollisionsCrash < ApplicationRecord
    self.table_name = :motor_vehicle_collisions_crashes

    SODA2_API_ENDPOINT = "https://data.cityofnewyork.us/resource/h9gi-nx95.json"
    SODA2_CSV_API_ENDPOINT = "https://data.cityofnewyork.us/resource/h9gi-nx95.csv"

    SODA3_API_ENDPOINT = "https://data.cityofnewyork.us/api/v3/views/h9gi-nx95/query.json"
    SODA3_CSV_API_ENDPOINT = "https://data.cityofnewyork.us/api/v3/views/h9gi-nx95/query.csv"

    def self.url
      "https://data.cityofnewyork.us/Public-Safety/Motor-Vehicle-Collisions-Crashes/h9gi-nx95/about_data"
    end

    def self.name
      "Motor Vehicle Collisions - Crashes"
    end

    def self.description
      "The Motor Vehicle Collisions crash table contains details on the crash event. Each row represents a crash event. The Motor Vehicle Collisions data tables contain information from all police reported motor vehicle collisions in NYC. The police report (MV104-AN) is required to be filled out for collisions where someone is injured or killed, or where there is at least $1000 worth of damage (https://www.nhtsa.gov/sites/nhtsa.dot.gov/files/documents/ny_overlay_mv-104an_rev05_2004.pdf). It should be noted that the data is preliminary and subject to change when the MV-104AN forms are amended based on revised crash details.For the most accurate, up to date statistics on traffic fatalities, please refer to the NYPD Motor Vehicle Collisions page (updated weekly) or Vision Zero View (updated monthly)."
    end

    def self.data_provided_by
      "Police Department (NYPD)"
    end

    # Dataset Information
    def self.agency
      "Police Department (NYPD)"
    end

    # Update
    def self.update_frequency
      "Daily"
    end

    def self.automation
      "Yes"
    end

    def self.date_made_public
      "5/7/2014"
    end

    # Topics
    def self.category
      "Public Safety"
    end

    def self.tags
      "nypd, collisions, bigapps, big apps, visionzero, vision, zero, nycopendata, traffic data"
    end

    # Import
    def self.import(api_version: '2', content_type: 'json')
      if api_version == '2' && content_type == 'json'
        import_soda2
      end

      if api_version == '2' && content_type == 'csv'
        import_soda2_csv
      end

      # if api_version == '3' && content_type == 'json'
      #   import_soda3
      # end

      # if api_version == '3' && content_type == 'csv'
      #   import_soda3_csv
      # end
    end

    def self.import_soda2
      data = RemoteDataset::Soda2::Json.new(remote_url: SODA2_API_ENDPOINT)

      data.each do |row|
        crash_date = row["crash_date"]
        crash_time = row["crash_time"]
        borough = row["borough"]
        zip_code = row["zip_code"]
        latitude = row["latitude"]
        longitude = row["longitude"]
        on_street_name = row["on_street_name"]
        off_street_name = row["off_street_name"]
        number_of_persons_injured = row["number_of_persons_injured"]
        number_of_persons_killed = row["number_of_persons_killed"]
        number_of_pedestrians_injured = row["number_of_pedestrians_injured"]
        number_of_pedestrians_killed = row["number_of_pedestrians_killed"]
        number_of_cyclist_injured = row ["number_of_cyclist_injured"]
        number_of_cyclist_killed = row["number_of_cyclist_killed"]
        number_of_motorist_injured = row["number_of_motorist_injured"]
        number_of_motorist_killed = row["number_of_motorist_killed"]
        contributing_factor_vehicle_1 = row["contributing_factor_vehicle_1"]
        contributing_factor_vehicle_2 = row["contributing_factor_vehicle_2"]
        contributing_factor_vehicle_3 = row["contributing_factor_vehicle_3"]
        contributing_factor_vehicle_4 = row["contributing_factor_vehicle_4"]
        contributing_factor_vehicle_5 = row["contributing_factor_vehicle_5"]
        collision_id = row["collision_id"]
        vehicle_type_code1 = row["vehicle_type_code1"]
        vehicle_type_code2 = row["vehicle_type_code2"]
        vehicle_type_code_3 = row["vehicle_type_code_3"]
        vehicle_type_code_4 = row["vehicle_type_code_4"]
        vehicle_type_code_5 = row["vehicle_type_code_5"]

        next if MotorVehicleCollisionsCrash.find_by(collision_id: collision_id).present?

        MotorVehicleCollisionsCrash.create!(
          crash_date: crash_date,
          crash_time: crash_time,
          borough: borough,
          zip_code: zip_code,
          latitude: latitude,
          longitude: longitude,
          on_street_name: on_street_name,
          off_street_name: off_street_name,
          number_of_persons_injured: number_of_persons_injured,
          number_of_persons_killed: number_of_persons_killed,
          number_of_pedestrians_injured: number_of_pedestrians_injured,
          number_of_pedestrians_killed: number_of_pedestrians_killed,
          number_of_cyclist_injured: number_of_cyclist_injured,
          number_of_cyclist_killed: number_of_cyclist_killed,
          number_of_motorist_injured: number_of_motorist_injured,
          number_of_motorist_killed: number_of_motorist_killed,
          contributing_factor_vehicle_1: contributing_factor_vehicle_1,
          contributing_factor_vehicle_2: contributing_factor_vehicle_2,
          contributing_factor_vehicle_3: contributing_factor_vehicle_3,
          contributing_factor_vehicle_4: contributing_factor_vehicle_4,
          contributing_factor_vehicle_5: contributing_factor_vehicle_5,
          collision_id: collision_id,
          vehicle_type_code1: vehicle_type_code1,
          vehicle_type_code2: vehicle_type_code2,
          vehicle_type_code_3: vehicle_type_code_3,
          vehicle_type_code_4: vehicle_type_code_4,
          vehicle_type_code_5: vehicle_type_code_5
        )
      end
    end
    private_class_method :import_soda2

    def self.import_soda2_csv
      csv = RemoteDataset::Soda2::Csv.new(remote_url: SODA2_CSV_API_ENDPOINT)

      csv.each do |row|
        crash_date = row[0]
        crash_time = row[1]
        borough = row[2]
        zip_code = row[3]
        latitude = row[4]
        longitude = row[5]
        _location = row[6]
        on_street_name = row[7]
        off_street_name = row[8]
        _cross_street_name = row[9]
        number_of_persons_injured = row[10]
        number_of_persons_killed = row[11]
        number_of_pedestrians_injured = row[12]
        number_of_pedestrians_killed = row[13]
        number_of_cyclist_injured = row [14]
        number_of_cyclist_killed = row[15]
        number_of_motorist_injured = row[16]
        number_of_motorist_killed = row[17]
        contributing_factor_vehicle_1 = row[18]
        contributing_factor_vehicle_2 = row[19]
        contributing_factor_vehicle_3 = row[20]
        contributing_factor_vehicle_4 = row[21]
        contributing_factor_vehicle_5 = row[22]
        collision_id = row[23]
        vehicle_type_code1 = row[24]
        vehicle_type_code2 = row[25]
        vehicle_type_code_3 = row[26]
        vehicle_type_code_4 = row[27]
        vehicle_type_code_5 = row[28]

        next if MotorVehicleCollisionsCrash.find_by(collision_id: collision_id).present?

        MotorVehicleCollisionsCrash.create!(
          crash_date: crash_date,
          crash_time: crash_time,
          borough: borough,
          zip_code: zip_code,
          latitude: latitude,
          longitude: longitude,
          on_street_name: on_street_name,
          off_street_name: off_street_name,
          number_of_persons_injured: number_of_persons_injured,
          number_of_persons_killed: number_of_persons_killed,
          number_of_pedestrians_injured: number_of_pedestrians_injured,
          number_of_pedestrians_killed: number_of_pedestrians_killed,
          number_of_cyclist_injured: number_of_cyclist_injured,
          number_of_cyclist_killed: number_of_cyclist_killed,
          number_of_motorist_injured: number_of_motorist_injured,
          number_of_motorist_killed: number_of_motorist_killed,
          contributing_factor_vehicle_1: contributing_factor_vehicle_1,
          contributing_factor_vehicle_2: contributing_factor_vehicle_2,
          contributing_factor_vehicle_3: contributing_factor_vehicle_3,
          contributing_factor_vehicle_4: contributing_factor_vehicle_4,
          contributing_factor_vehicle_5: contributing_factor_vehicle_5,
          collision_id: collision_id,
          vehicle_type_code1: vehicle_type_code1,
          vehicle_type_code2: vehicle_type_code2,
          vehicle_type_code_3: vehicle_type_code_3,
          vehicle_type_code_4: vehicle_type_code_4,
          vehicle_type_code_5: vehicle_type_code_5
        )
      end
    end
    private_class_method :import_soda2_csv
  end
end
