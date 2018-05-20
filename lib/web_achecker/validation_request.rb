require "nokogiri"

module WebAchecker
  # ValidationRequest handles extracting information from the Web Service API
  # response provided by the AChecker service.
  class ValidationRequest
    attr_reader :http_response, :results, :response_body_xml

    def initialize(http_response)
      @http_response = http_response
      @response_body_xml = Nokogiri::XML(http_response.body)
      @results = response_body_xml.xpath("//result")
    end

    def status
      valid? ? "SUCCESS" : "FAILURE"
    end

    def valid?
      error_count == 0
    end

    def summary_status
      response_body_xml.xpath("//summary//status").text
    end

    def error_count
      response_body_xml.xpath("//summary//NumOfErrors").text.to_i
    end

    def likely_problem_count
      response_body_xml.xpath("//summary//NumOfLikelyProblems").text.to_i
    end

    def potential_problem_count
      response_body_xml.xpath("//summary//NumOfPotentialProblems").text.to_i
    end
  end
end
