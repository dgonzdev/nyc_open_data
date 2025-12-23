module OfficeOfCitywideEventCoordinationAndManagement
  class NycPermittedEventInformationHistorical < ApplicationRecord
    self.table_name = :nyc_permitted_event_information_historicals

    SODA2_API_ENDPOINT = "https://data.cityofnewyork.us/resource/bkfu-528j.json"
    SODA2_CSV_API_ENDPOINT = "https://data.cityofnewyork.us/resource/bkfu-528j.csv"

    SODA3_API_ENDPOINT = "https://data.cityofnewyork.us/api/v3/views/bkfu-528j/query.json"
    SODA3_CSV_API_ENDPOINT = "https://data.cityofnewyork.us/api/v3/views/bkfu-528j/query.csv"
  end
end