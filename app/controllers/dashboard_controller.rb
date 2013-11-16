class DashboardController < ApplicationController
  before_filter :authenticate_user!
  before_filter :request_subscription

  def index
    render text: 'You have access to all those paid features'
  end
end
