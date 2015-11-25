require 'bundler'
require 'English'
Bundler.require
require './src/aweber_api.rb'
require 'json'
require 'sinatra/json'

post '/api/parsecom/:access_token' do
  puts JSON.pretty_generate(request.env)
  unless params[:access_token] == ENV['BRIDGE_TOKEN']
    puts 'Wrong access token!'
    return status 404
  end

  body = request.env['rack.input'].read
  puts "body = #{body}"
  post_params = JSON.parse(body)
  puts "post_params = #{post_params.inspect}"

  @email = post_params['object']['email']
  if post_params['object']['username'] =~ /^.+@.+$/
    @email ||= post_params['object']['username']
  end
  @name = post_params['object']['name']
  begin
    unless @email.nil? || @email == ''
      AweberApi.instance.add_subscriber(@email, @name)
    end
  rescue AWeber::CreationError
    puts "Subscriber #{@email} already exists"
  rescue
    puts $ERROR_INFO.message
  end
  json success: true
end
