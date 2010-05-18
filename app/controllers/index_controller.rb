require 'oauth'
require 'json'

# your application consumer key & secret
CONSUMER_KEY = ''
CONSUMER_SECRET = ''

class IndexController < ApplicationController
  def self.consumer
    OAuth::Consumer.new(
      CONSUMER_KEY,
      CONSUMER_SECRET,
      { :site => "http://twitter.com" }
    )
  end
 
  def index
  end
 
  def oauth
    print_obj self.class
    request_token = IndexController.consumer.get_request_token(
      :oauth_callback => "http://#{request.host_with_port}/oauth_callback"
    )
    session[:request_token] = request_token.token
    session[:request_token_secret] = request_token.secret
    
    redirect_to request_token.authorize_url
  end
 
  def oauth_callback
    consumer = IndexController.consumer
    request_token = OAuth::RequestToken.new(
      consumer,
      session[:request_token],
      session[:request_token_secret]
    )
    access_token = request_token.get_access_token(
      {},
      :oauth_token => params[:oauth_token],
      :oauth_verifier => params[:oauth_verifier]
    )
  
    @params = access_token.params

    response = access_token.get('http://twitter.com/statuses/friends_timeline.json')
    @statuses = JSON.parse(response.body).each.collect do |status|
      status
    end
  end

  private
  def print_obj obj
    p "#####"
    p obj
    p "#####"
  end
end
