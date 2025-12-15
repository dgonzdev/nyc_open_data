module Etl
  module Tasks
    module Sources
      class SodaCsv2Source
        attr_reader :soda2_csv_url

        # https://github.com/thbar/kiba/wiki/Implementing-ETL-sources
        def initialize(remote_url:)
          @soda2_csv_url = remote_url
        end

        def each
          csv = RemoteDataset::Soda2::Csv.new(remote_url: soda2_csv_url)

          csv.each do |row|
            yield(row.to_hash)
          end
        end
      end
    end
  end
end