module Prinetti
  class Response
    def initialize(http_response)
      @response = http_response
    end

    def http_status
      @response.code
    end

    def http_headers
      @response.headers
    end

    def http_body
      @response.body
    end

    def xml
      @xml ||= Nokogiri::XML(http_body)
    end

    def status
      xml.xpath("/eChannel/Response/response.Status").text
    end

    def message
      xml.xpath("/eChannel/Response/response.Message").text
    end

    def tracking
      xml.xpath("/eChannel/Response/Response.TrackingCode").text
    end

    def pdf_link
      xml.xpath("/eChannel/Response/Response.Link").text
    end

    def pdf_file
      xml.xpath("/eChannel/Response/Response.File").text
    end
  end
end
