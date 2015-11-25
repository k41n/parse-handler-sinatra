# This implements part of AWeber REST api for creating subscribers
class AweberApi
  include Singleton

  def initialize
    require 'aweber'
    @aweber = AWeber::Base.new(oauth)
    @target_list = ENV['AWEBER_TARGET_LIST']
  end

  def add_subscriber(email, name)
    new_subscriber = {}
    new_subscriber['email'] = email
    new_subscriber['name'] = name
    @aweber.account.lists.find_by_name(@target_list)
      .subscribers.create(new_subscriber)
  end

  private

  def oauth
    return @oauth if @oauth
    @oauth = AWeber::OAuth.new(
      ENV['AWEBER_CONSUMER_KEY'],
      ENV['AWEBER_CONSUMER_SECRET']
    )
    @oauth.authorize_with_access(
      ENV['AWEBER_ACCESS_TOKEN'],
      ENV['AWEBER_TOKEN_SECRET']
    )
    @oauth
  end
end
