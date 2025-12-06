require 'open-uri'
require 'csv'

module RemoteDataset
  module Csv
    class Soda2
      attr_reader :remote_url
      attr_reader :page_number
      attr_reader :page_size

      def initialize(remote_url:, page_number: 1, page_size: 50000)
        @remote_url = remote_url
        @page_number = page_number
        @page_size = page_size
      end

      def each
        _page_number = 1
        _offset = (_page_number - 1) * page_size

        uri = URI(remote_url)
        uri.query = URI.encode_www_form({ "$limit" => page_size, "$offset" => _offset, "$order" => "id ASC" })
        remote_url_with_pagination = uri.to_s

        csv = CSV.new(
          URI.open(remote_url_with_pagination),
          headers: true,
          header_converters: :symbol
        )

        while csv.count > 0
          csv.rewind

          csv.each do |row|
            yield row
          end

          _page_number += 1
          _offset = (_page_number - 1) * page_size

          uri = URI(remote_url)
          uri.query = URI.encode_www_form({ "$limit" => page_size, "$offset" => _offset, "$order" => "id ASC" })
          remote_url_with_pagination = uri.to_s

          csv = CSV.new(
            URI.open(remote_url_with_pagination),
            headers: true,
            header_converters: :symbol
          )
        end
      end
    end
  end
end