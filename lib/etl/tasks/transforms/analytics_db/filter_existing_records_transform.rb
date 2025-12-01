module Etl
  module Tasks
    module Transforms
      module AnalyticsDb
        class FilterExistingRecordsTransform
          attr_reader :model
          attr_reader :search_keys

          # https://github.com/thbar/kiba/wiki/Implementing-ETL-transforms
          def initialize(model:, search_keys:)
            @model = model
            @search_keys = search_keys
          end

          def process(row)
            search_params = search_keys.each_with_object({}) do |search_key, obj|
              column_name = search_key[0]
              row_name = search_key[1]

              obj[column_name] = row[row_name]
            end

            model
              .where(search_params)
              .blank? ? row : nil
          end
        end
      end
    end
  end
end
