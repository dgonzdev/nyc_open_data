module Etl
  module Tasks
    module Sources
      class Soda3CsvSource
        attr_reader :soda3_csv_url

        # https://github.com/thbar/kiba/wiki/Implementing-ETL-sources
        def initialize(remote_url:)
          @soda3_csv_url = remote_url
        end

        def each
          csv = RemoteDataset::Soda3::Csv.new(remote_url: soda3_csv_url)

          csv.each do |row|
            yield(row.to_hash)
          end
        end
      end
    end
  end
end