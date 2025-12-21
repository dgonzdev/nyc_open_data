module Etl
  module Runners
    module PrimaryDbImports
      module NycPermittedEventInformation
        class Soda2IntoPrimaryDb
          def self.run
            job = Etl::WorkflowTemplates::Soda2IntoPrimaryDb.setup({
              source_config: {
                remote_url: ::OfficeOfCitywideEventCoordinationAndManagement::NycPermittedEventInformation::SODA2_API_ENDPOINT
              },
              transform_config: {
                model: ::OfficeOfCitywideEventCoordinationAndManagement::NycPermittedEventInformation,
                search_keys: [
                  [:event_id, :event_id],
                  [:start_date_time, :start_date_time],
                  [:end_date_time, :end_date_time]
                ]
              },
              destination_config: {
                model: ::OfficeOfCitywideEventCoordinationAndManagement::NycPermittedEventInformation,
                column_keys: [
                  [:event_id, :event_id],
                  [:event_name, :event_name],
                  [:start_date_time, :start_date_time],
                  [:end_date_time, :end_date_time],
                  [:event_agency, :event_agency],
                  [:event_type, :event_type],
                  [:event_borough, :event_borough],
                  [:event_location, :event_location],
                  [:event_street_side, :event_street_side],
                  [:street_closure_type, :street_closure_type],
                  [:community_board, :community_board],
                  [:police_precinct, :police_precinct]
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