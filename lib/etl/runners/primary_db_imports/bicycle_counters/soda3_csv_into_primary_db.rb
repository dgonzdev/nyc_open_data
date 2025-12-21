module Etl
  module Runners
    module PrimaryDBImports
      module BicycleCounters
        class Soda3CsvIntoPrimaryDb
          def self.run
            job = Etl::WorkflowTemplates::Soda3CsvIntoPrimaryDb.setup({
              source_config: {
                remote_url: ::DepartmentOfTransportation::BicycleCounter::SODA3_CSV_API_ENDPOINT
              },
              transform_config: {
                model: ::DepartmentOfTransportation::BicycleCounter,
                search_keys: [
                  [:original_id, :id]
                ]
              },
              destination_config: {
                model: ::DepartmentOfTransportation::BicycleCounter,
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
  end
end