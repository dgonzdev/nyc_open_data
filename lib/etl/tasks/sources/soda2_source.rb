module Etl
  module Tasks
    module Sources
      class Soda2Source
        attr_reader :soda2_url

        # https://github.com/thbar/kiba/wiki/Implementing-ETL-sources
        def initialize(remote_url:)
          @soda2_url = remote_url
        end

        def each
          dataset = RemoteDataset::Soda2::Json.new(remote_url: soda2_url)

          dataset.each do |row|
            yield(row)
          end
        end
      end
    end
  end
end