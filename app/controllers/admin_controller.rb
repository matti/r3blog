class AdminController < ApplicationController

  before_filter :authorize
  

  private

  def authorize
    authenticate_or_request_with_http_basic('Administration') do |username, password|
      if username == R3blog::Config::Admin::USER && password == R3blog::Config::Admin::PASS
        return true
      end
    end
  end
  

end
