require "net/http"
require "cgi"
require "uri"

require "web_achecker/settings"
require "web_achecker/validation_request"

module WebAchecker
  # Base API Class to be used to generate requests and format responses from:
  # https://achecker.ca/documentation/web_service_api.php
  class WebServiceApi
    # Main interface to Web Service API.
    #
    # Example Call:
    # => WebAchecker::WebServiceApi.validate(url: "https://google.com")
    def self.validate(url:)
      new(uri: CGI::escape(url), id: Settings.api_key).response
    end

    # Allows for full range of parameters as specified by the AChecker docs.
    def initialize(**opts)
      @uri = opts.fetch(:uri)
      @id = opts.fetch(:id)
      @guide = opts.fetch(:guide, Settings.default_guide)
      @output = opts.fetch(:output, Settings.default_output)
      @offset = opts.fetch(:offset, Settings.default_offset)
      @api_url = opts.fetch(:api_url, Settings.base_api_url)
    end

    def response
      @response ||= ValidationRequest.new(http_response)
    end

    private

    attr_reader :uri, :id, :guide, :output, :offset, :api_url

    def http_response
      Net::HTTP.get_response(api_request_url)
    end

    def api_request_url
      URI(formatted_request_url)
    end

    def formatted_request_url
      api_url
        .yield_self { |u| "#{u}?uri=#{uri}" }
        .yield_self { |u| "#{u}&id=#{id}" }
        .yield_self { |u| "#{u}&guide=#{guide}" }
        .yield_self { |u| "#{u}&output=#{output}" }
        .yield_self { |u| "#{u}&offset=#{offset}" }
    end
  end
end
