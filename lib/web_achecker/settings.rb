module WebAchecker
  class Settings
    def self.api_key
      ENV["ACHECKER_WEB_SERVICE_ID"]
    end

    # ENV["ACHECKER_BASE_API_URI"] || default_base_api_url
    def self.base_api_url
      "https://achecker.ca/checkacc.php"
    end

    # TODO: Expand on this; model out valid API options to validate against.
    def self.default_guide
      "WCAG2-AA"
    end

    # TODO: Use HTML in final version to better map to API settings/docs.
    # TODO: Expand on this; model out valid API options to validate against.
    def self.default_output
      "rest"
    end

    # TODO: Expand on this; model out valid API options to validate against.
    def self.default_offset
      "0"
    end
  end
end
