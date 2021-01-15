class Admin::DashboardController < ApplicationController
  before_filter :authentication_check

  def show
    puts "This string"
  end

   private
    def authentication_check
     authenticate_or_request_with_http_basic do |user, password|
      user == ENV["ADMIN_USER"] && password == ENV["ADMIN_PASS"]
     end
    end

end
