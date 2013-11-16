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

  def close_account(account_unique_identifier)
    # no need to verify the output of find since it will raise if no match is found
    account = Recurly::Account.find(account_unique_identifier)
    # close the account
    account.destroy
    # as well, terminate subscription without refund, immediately, so that 
    # our MRR and active subscriptions are reported properly, otherwise they
    # will remain live until the termination date
    account.subscriptions.live.each { |s| s.terminate(:none) }
  end

end