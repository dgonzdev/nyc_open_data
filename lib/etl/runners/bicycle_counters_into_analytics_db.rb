module Etl
  module Runners
    class BicycleCountersIntoAnalyticsDb
      def self.run
        job = Etl::WorkflowTemplates::CsvSoda2IntoAnalyticsDb.setup({
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

        Kiba.run(job)
      end
    end
  end
end