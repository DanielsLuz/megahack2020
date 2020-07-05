module ZenviaCalls
  class SendSmsCall < BaseCall
    def initialize(to:, text:)
      @to = to
      @text = text
    end

    def call
      RestClient::Request.execute(
        method: :post,
        url: "#{api_url}/channels/sms/messages",
        payload: payload,
        headers: headers
      )
    end

    private

    def payload
      {
        from: sender_identifier,
        to: @to,
        contents: [
          type: 'text',
          text: @text
        ]
      }.to_json
    end
  end
end
