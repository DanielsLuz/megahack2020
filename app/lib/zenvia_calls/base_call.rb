module ZenviaCalls
  class BaseCall
    define_method(:cfg) { Rails.application.config.zenvia_cfg }
    define_method(:api_url) { cfg[:api_url] }
    define_method(:sender_identifier) { cfg[:sender_identifier] }
    define_method(:api_token) { cfg[:api_token] }

    private

    def headers
      {
        'Content-Type': 'application/json',
        'X-API-TOKEN': api_token
      }
    end
  end
end
