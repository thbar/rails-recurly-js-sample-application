module BillingService
  extend self

  def trial_ends_at
    (Rails.configuration.trial_duration + 1).days.from_now.at_midnight
  end

  def confirm_subscription(user, token)
    subscription = Recurly.js.fetch(token)
    return false unless subscription.is_a?(Recurly::Subscription)
    account = subscription.account
    return false unless account.account_code == user.recurly_account_code
    return false unless account.state == 'active'
    return false unless subscription.state == 'active'
    user.update_attribute(:recurly_enabled, true)
    return true
  end
end