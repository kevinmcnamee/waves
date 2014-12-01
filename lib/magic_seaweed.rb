require 'rest_client'
require './lib/report'
require 'dotenv'

class MagicSeaweed
  def self.reports
    @reports ||= [].tap do |reports|
      api_response.each do |args|
        reports << Report.new(args)
      end
    end
  end

  private

  def self.api_response
    response = RestClient.get(url)
    JSON.parse(response)
  end

  def self.url
    "http://magicseaweed.com/api/#{ENV['MAGIC_SEAWEED_API_KEY']}/forecast/?spot_id=389"
  end
end
