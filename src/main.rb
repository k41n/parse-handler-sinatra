require 'bundler'
Bundler.require
require './awever_api.rb'

post '/api/parsecom/:access_token' do
  puts "POST with params: #{params}"
  unless params[:access_token] == ENV['BRIDGE_TOKEN']
    puts 'Wrong access token!'
    return status 404
  end

  @email = params[:update][:email]
  if params[:update][:username] =~ /^.+@.+$/
    @email ||= params[:update][:username]
  end
  @name = params[:update][:name]
  begin
    AweberApi.instance.add_subscriber(@email, @name) unless @email.blank?
  rescue AWeber::CreationError
    puts "Subscriber #{@email} already exists"
  rescue
    puts $ERROR_INFO.message
  end
  status 200
end
