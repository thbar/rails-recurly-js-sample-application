class RegistrationsController < Devise::RegistrationsController
  # Here is the right place to notify yourself if you'd like
  after_filter({:only => :create}) do
  end

  def destroy
    if current_user.recurly_enabled
      BillingService.close_account(current_user.recurly_account_code)
    end
    # Here you can send the user a specific email
    # You could also send you the reason entered by the user
    # + LTV + activity before cancellation
    super
  end
end