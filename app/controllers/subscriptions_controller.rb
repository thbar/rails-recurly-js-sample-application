class SubscriptionsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_if_no_subscription_needed, except: [:confirm, :update, :error, :edit]
  protect_from_forgery except: [:confirm] # as recommended by Recurly

  def confirm
    if current_user.recurly_enabled?
      redirect_to dashboard_url, notice: "Subscription already activated!"
    else
      if BillingService.confirm_subscription(current_user, params[:recurly_token].to_s)
        redirect_to help_url, notice: "Your subscription has been successfully activated!"
      else
        redirect_to error_subscription_url, alert: "An error occurred!"
      end
    end
 end

  def new
    # Using gon here to avoid using to_json.html_safe all over the
    # place which allows injection in some cases 
    # see https://github.com/rails/rails/pull/6094
    gon.recurly_plan_code = 'freelancer' # you'll want to pass it as a param and whitelist it if you have more than one
    gon.recurly_subdomain = Recurly.subdomain
    gon.recurly_signature = Recurly.js.sign({
      account: {
        account_code: current_user.recurly_account_code
      },
      subscription:
        {
          plan_code: gon.recurly_plan_code,
          # Use this attribute instead of configuring a trial
          # on the plan itself in Recurly back-end, otherwise
          # the amount displayed will be 0
          trial_ends_at: BillingService.trial_ends_at
        }
    })
    gon.recurly_account_code = current_user.recurly_account_code
    gon.recurly_email = current_user.email
    gon.recurly_trial_ends_at = BillingService.trial_ends_at
    gon.recurly_success_url = confirm_subscription_path
  end
end