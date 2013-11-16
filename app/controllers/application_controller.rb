class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

private
  def request_subscription
    if current_user && !current_user.recurly_enabled
      redirect_to new_subscription_url
    end
  end

  def check_if_no_subscription_needed
    redirect_to '/' if current_user && current_user.recurly_enabled
  end
end
