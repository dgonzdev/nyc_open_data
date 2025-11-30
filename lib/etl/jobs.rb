module Etl
  class Jobs
    def self.bicycle_counters_into_analytics_db
      Etl::Workflows::CsvSoda2IntoPrimaryDbWorkflow.setup({
        source_config: {
          remote_url: ::DepartmentOfTransportation::BicycleCounter::CSV_SODA2_API_ENDPOINT
        },
        transform_config: {
          model: ::Analytics::BicycleCounter,
          search_keys: [
            [:original_id, :id]
          ]
        },
        destination_config: {
          model: ::Analytics::BicycleCounter,
          column_keys: [
            [:original_id, :id],
            [:name, :name],
            [:domain, :domain],
            [:latitude, :latitude],
            [:longitude, :longitude],
            [:interval, :interval],
            [:timezone, :timezone],
            [:sens, :sens],
            [:counter, :counter]
          ]
        }
      })
    end
  end
end