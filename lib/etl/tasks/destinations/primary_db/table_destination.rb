module Etl
  module Tasks
    module Destinations
      module PrimaryDb
        class TableDestination
          attr_reader :model
          attr_reader :column_keys

          # https://github.com/thbar/kiba/wiki/Implementing-ETL-destinations
          def initialize(model:, column_keys:)
            @model = model
            @column_keys = column_keys
          end

          def write(row)
            values = column_keys.each_with_object({}) do |column_key, obj|
              column_name = column_key[0]
              row_name = column_key[1]

              obj[column_name] = row[row_name]
            end

            model.create!(values)
          end
        end
      end
    end
  end
end