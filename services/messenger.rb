require 'twilio-ruby'

class Messenger
  attr_reader :number, :message, :media

  def initialize(number, message, media=nil)
    @number = number
    @message = message
    @media = media
  end

  def send
    twilio.messages.create(message_body)
  end

  private

  def message_body
    message = {
      from: twilio_phone_number,
      to: number,
      body: message
    }

    message.merge!(media_url: media) if media

    message
  end

  def twilio
    @twilio ||= Twilio::REST::Client.new ENV['TWILIO_ACCT_ID'], ENV['TWILIO_AUTH_TOKEN']
  end

  def twilio_phone_number
    ENV['TWILIO_PHONE_NUMBER']
  end
end
