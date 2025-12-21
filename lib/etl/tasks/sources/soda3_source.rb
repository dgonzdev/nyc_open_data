module Etl
  module Tasks
    module Sources
      class Soda3Source
        attr_reader :soda3_url

        # https://github.com/thbar/kiba/wiki/Implementing-ETL-sources
        def initialize(remote_url:)
          @soda3_url = remote_url
        end

        def each
          dataset_pages = RemoteDataset::Soda3::Json.new(remote_url: soda3_url)

          dataset_pages.each do |row|
            yield(row)
          end
        end
      end
    end
  end
end