require 'sinatra'
require './services/messenger'
require './lib/magic_seaweed'
require 'dotenv'

Dotenv.load

get '/swell' do
  content_type :json

  MagicSeaweed.reports.to_json
end

get 'sms' do
  reports = MagicSeaweed.reports

  Messenger.new(
    '+17046097681',
    reports.first.period,
    reports.first.swell_chart
  ).send

  200
end
