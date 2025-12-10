require 'net/http'

module RemoteDataset
  module Json
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

        response = api_call(_page_number, _offset)

        data = JSON.parse(response.body)

        while data.size > 0
          data.each do |row|
            yield row
          end

          _page_number += 1
          _offset = (_page_number - 1) * page_size

          response = api_call(_page_number, _offset)

          data = JSON.parse(response.body)
        end
      end

      private

      def api_call(_page_number, _offset)
        uri = URI(remote_url)
        uri.query = URI.encode_www_form({ "$limit" => page_size, "$offset" => _offset })
        Net::HTTP.get_response(uri)
      end
    end
  end
end