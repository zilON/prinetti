module Prinetti
  class Client

    def initialize(key, secret)
      @key    = key
      @secret = secret

      @message = Prinetti::Request::Message.new
    end

    attr_accessor :message

    attr_reader :response

    def request
      uri = URI.parse("https://echannel.prinetti.net")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Post.new("/import.php")
      request.add_field('Content-Type', 'text/xml')
      request.body = @message.to_xml
      response = http.request(request)
      @response = Prinetti::Response.new(response)
    end
  end
end
