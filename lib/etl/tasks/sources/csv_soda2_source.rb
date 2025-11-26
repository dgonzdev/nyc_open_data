require 'open-uri'
require 'csv'

module Etl
  module Tasks
    module Sources
      class CsvSoda2Source
        attr_reader :csv_soda2_url

        # https://github.com/thbar/kiba/wiki/Implementing-ETL-sources
        def initialize(remote_url:)
          @csv_soda2_url = remote_url
        end

        def each
          CSV.new(
            URI.open(csv_soda2_url),
            headers: true,
            header_converters: :symbol
          ).each do |row|
            yield(row.to_hash)
          end
        end
      end
    end
  end
end