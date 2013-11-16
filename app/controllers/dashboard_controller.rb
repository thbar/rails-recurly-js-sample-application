class DashboardController < ApplicationController
  before_filter :authenticate_user!
  before_filter :request_subscription
end
