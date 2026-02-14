module OfficeOfCitywideEventCoordinationAndManagement
  class NycPermittedEventInformationHistorical < ApplicationRecord
    self.table_name = :nyc_permitted_event_information_historicals

    SODA2_API_ENDPOINT = "https://data.cityofnewyork.us/resource/bkfu-528j.json"
    SODA2_CSV_API_ENDPOINT = "https://data.cityofnewyork.us/resource/bkfu-528j.csv"

    SODA3_API_ENDPOINT = "https://data.cityofnewyork.us/api/v3/views/bkfu-528j/query.json"
    SODA3_CSV_API_ENDPOINT = "https://data.cityofnewyork.us/api/v3/views/bkfu-528j/query.csv"

    def self.url
      "https://data.cityofnewyork.us/City-Government/NYC-Permitted-Event-Information-Historical/bkfu-528j/about_data"
    end

    def self.name
      "NYC Permitted Event Information - Historical"
    end

    def self.description
      "This list contains information on approved event applications from 2008. Please note that Permitted Film Events only reflect those permits which will impact one or more streets for at least five days."
    end

    def self.data_provided_by
      nil
    end

    # Dataset Information
    def self.agency
      "Office of Citywide Event Coordination and Management (CECM)"
    end

    # Update
    def self.update_frequency
      "As Needed"
    end

    def self.automation
      "Yes"
    end

    def self.date_made_public
      "9/11/2017"
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

        next if NycPermittedEventInformationHistorical.where(
          event_id: event_id,
          start_date_time: start_date_time,
          end_date_time: end_date_time
        ).any?

        NycPermittedEventInformationHistorical.create!(
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

        next if NycPermittedEventInformationHistorical.where(
          event_id: event_id,
          start_date_time: start_date_time,
          end_date_time: end_date_time
        ).any?

        NycPermittedEventInformationHistorical.create!(
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

        next if NycPermittedEventInformationHistorical.where(
          event_id: event_id,
          start_date_time: start_date_time,
          end_date_time: end_date_time
        ).any?

        NycPermittedEventInformationHistorical.create!(
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

        next if NycPermittedEventInformationHistorical.where(
          event_id: event_id,
          start_date_time: start_date_time,
          end_date_time: end_date_time
        ).any?

        NycPermittedEventInformationHistorical.create!(
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
  end
end