require 'open-uri'
require 'csv'

class RemoteCSV
  def self.open(remote_url, soda_version: 2)
    if soda_version == 2
      return CSV.new(
        URI.open(remote_url),
        headers: true,
        header_converters: :symbol
      )
    end

    if soda_version == 3
      username = ENV['SOCRATA_API_KEY_ID']
      password = ENV['SOCRATA_API_KEY_SECRET']
      credentials = Base64.strict_encode64("#{username}:#{password}")
      authorization_header = "Basic #{credentials}"

      return CSV.new(
        URI.open(
          remote_url, {
            'Authorization' => authorization_header
        }),
        headers: true,
        header_converters: :symbol
      )
    end
  end
end