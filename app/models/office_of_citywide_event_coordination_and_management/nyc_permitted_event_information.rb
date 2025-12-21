module OfficeOfCitywideEventCoordinationAndManagement
  class NycPermittedEventInformation < ApplicationRecord
    self.table_name = :nyc_permitted_event_informations

    SODA2_API_ENDPOINT = "https://data.cityofnewyork.us/resource/tvpp-9vvx.json"
    SODA2_CSV_API_ENDPOINT = "https://data.cityofnewyork.us/resource/tvpp-9vvx.csv"

    SODA3_API_ENDPOINT = "https://data.cityofnewyork.us/api/v3/views/tvpp-9vvx/query.json"
    SODA3_CSV_API_ENDPOINT = "https://data.cityofnewyork.us/api/v3/views/tvpp-9vvx/query.csv"

    def self.url
      "https://data.cityofnewyork.us/City-Government/NYC-Permitted-Event-Information/tvpp-9vvx/about_data"
    end

    def self.name
      "NYC Permitted Event Information"
    end

    def self.description
      "This list contains information on approved event applications that will occur within the next month. Please note that Permitted Film Events only reflect those permits which will impact one or more streets for at least five days."
    end

    def self.data_provided_by
      "Office of Citywide Event Coordination and Management (CECM)"
    end

    # Dataset Information
    def self.agency
      "Office of Citywide Event Coordination and Management (CECM)"
    end

    # Update
    def self.update_frequency
      "Daily"
    end

    def self.automation
      "Yes"
    end

    def self.date_made_public
      "11/19/2013"
    end

    # Topics
    def self.category
      "City Government"
    end

    def self.tags
      "event, to do, activity, park, block party, festival, nyc permitted event information, otm, office of the mayor"
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
      data = RemoteDataset::Soda2::Json.new(remote_url: SODA2_API_ENDPOINT)

      data.each do |row|
        event_id = row["event_id"]
        event_name = row["event_name"]
        start_date_time = row["start_date_time"]
        end_date_time = row["end_date_time"]
        event_agency = row["event_agency"]
        event_type = row["event_type"]
        event_borough = row["event_borough"]
        event_location = row["event_location"]
        event_street_side = row["event_street_side"]
        street_closure_type = row["street_closure_type"]
        community_board = row["community_board"]
        police_precinct = row["police_precinct"]

        next if NycPermittedEventInformation.where(
          event_id: event_id,
          start_date_time: start_date_time,
          end_date_time: end_date_time
        ).any?

        NycPermittedEventInformation.create!(
          event_id: event_id,
          event_name: event_name,
          start_date_time: start_date_time,
          end_date_time: end_date_time,
          event_agency: event_agency,
          event_type: event_type,
          event_borough: event_borough,
          event_location: event_location,
          event_street_side: event_street_side,
          street_closure_type: street_closure_type,
          community_board: community_board,
          police_precinct: police_precinct
        )
      end
    end
    private_class_method :import_soda2

    def self.import_soda2_csv
      csv = RemoteDataset::Soda2::Csv.new(remote_url: SODA2_CSV_API_ENDPOINT)

      csv.each do |row|
        event_id = row[0]
        event_name = row[1]
        start_date_time = row[2]
        end_date_time = row[3]
        event_agency = row[4]
        event_type = row[5]
        event_borough = row[6]
        event_location = row[7]
        event_street_side = row[8]
        street_closure_type = row[9]
        community_board = row[10]
        police_precinct = row[11]

        next if NycPermittedEventInformation.where(
          event_id: event_id,
          start_date_time: start_date_time,
          end_date_time: end_date_time
        ).any?

        NycPermittedEventInformation.create!(
          event_id: event_id,
          event_name: event_name,
          start_date_time: start_date_time,
          end_date_time: end_date_time,
          event_agency: event_agency,
          event_type: event_type,
          event_borough: event_borough,
          event_location: event_location,
          event_street_side: event_street_side,
          street_closure_type: street_closure_type,
          community_board: community_board,
          police_precinct: police_precinct
        )
      end
    end
    private_class_method :import_soda2_csv

    def self.import_soda3
      data = RemoteDataset::Soda3::Json.new(remote_url: SODA3_API_ENDPOINT)

      data.each do |row|
        event_id = row["event_id"]
        event_name = row["event_name"]
        start_date_time = row["start_date_time"]
        end_date_time = row["end_date_time"]
        event_agency = row["event_agency"]
        event_type = row["event_type"]
        event_borough = row["event_borough"]
        event_location = row["event_location"]
        event_street_side = row["event_street_side"]
        street_closure_type = row["street_closure_type"]
        community_board = row["community_board"]
        police_precinct = row["police_precinct"]

        next if NycPermittedEventInformation.where(
          event_id: event_id,
          start_date_time: start_date_time,
          end_date_time: end_date_time
        ).any?

        NycPermittedEventInformation.create!(
          event_id: event_id,
          event_name: event_name,
          start_date_time: start_date_time,
          end_date_time: end_date_time,
          event_agency: event_agency,
          event_type: event_type,
          event_borough: event_borough,
          event_location: event_location,
          event_street_side: event_street_side,
          street_closure_type: street_closure_type,
          community_board: community_board,
          police_precinct: police_precinct
        )
      end
    end
    private_class_method :import_soda3

    def self.import_soda3_csv
      csv = RemoteDataset::Soda3::Csv.new(remote_url: SODA3_CSV_API_ENDPOINT)

      csv.each do |row|
        event_id = row[0]
        event_name = row[1]
        start_date_time = row[2]
        end_date_time = row[3]
        event_agency = row[4]
        event_type = row[5]
        event_borough = row[6]
        event_location = row[7]
        event_street_side = row[8]
        street_closure_type = row[9]
        community_board = row[10]
        police_precinct = row[11]

        next if NycPermittedEventInformation.where(
          event_id: event_id,
          start_date_time: start_date_time,
          end_date_time: end_date_time
        ).any?

        NycPermittedEventInformation.create!(
          event_id: event_id,
          event_name: event_name,
          start_date_time: start_date_time,
          end_date_time: end_date_time,
          event_agency: event_agency,
          event_type: event_type,
          event_borough: event_borough,
          event_location: event_location,
          event_street_side: event_street_side,
          street_closure_type: street_closure_type,
          community_board: community_board,
          police_precinct: police_precinct
        )
      end
    end
    private_class_method :import_soda3_csv

    def self.run_import(api_version: '2', content_type: 'json')
      if api_version == '2' && content_type == 'json'
        run_import_soda2
      end

      if api_version == '2' && content_type == 'csv'
        run_import_soda2_csv
      end

      if api_version == '3' && content_type == 'json'
        run_import_soda3
      end

      if api_version == '3' && content_type == 'csv'
        run_import_soda3_csv
      end
    end

    def self.run_import_soda2
      Etl::Runners::PrimaryDbImports::NycPermittedEventInformation::Soda2IntoPrimaryDb.run
    end
    private_class_method :run_import_soda2

    def self.run_import_soda2_csv
      Etl::Runners::PrimaryDbImports::NycPermittedEventInformation::Soda2CsvIntoPrimaryDb.run
    end
    private_class_method :run_import_soda2_csv

    def self.run_import_soda3
      Etl::Runners::PrimaryDbImports::NycPermittedEventInformation::Soda3IntoPrimaryDb.run
    end
    private_class_method :run_import_soda3

    def self.run_import_soda3_csv
      Etl::Runners::PrimaryDbImports::NycPermittedEventInformation::Soda3CsvIntoPrimaryDb.run
    end
    private_class_method :run_import_soda3_csv
  end
end
