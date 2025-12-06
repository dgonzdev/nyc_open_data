require 'open-uri'
require 'csv'

class RemoteDataset
  attr_reader :remote_url
  attr_reader :pageNumber
  attr_reader :pageSize

  def initialize(remote_url:, page_number: 1, page_size: 50000)
    @remote_url = remote_url
    @pageNumber = page_number
    @pageSize = page_size
  end

  def each
    _pageNumber = 1
    _offset = (_pageNumber - 1) * pageSize

    uri = URI(remote_url)
    uri.query = URI.encode_www_form({ "$limit" => pageSize, "$offset" => _offset, "$order" => "id ASC" })
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

      _pageNumber += 1
      _offset = (_pageNumber - 1) * pageSize

      uri = URI(remote_url)
      uri.query = URI.encode_www_form({ "$limit" => pageSize, "$offset" => _offset, "$order" => "id ASC" })
      remote_url_with_pagination = uri.to_s

      csv = CSV.new(
        URI.open(remote_url_with_pagination),
        headers: true,
        header_converters: :symbol
      )
    end
  end
end