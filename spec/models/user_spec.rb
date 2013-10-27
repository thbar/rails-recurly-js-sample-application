require 'spec_helper'

describe User do
  it 'automatically generates a recurly_account_code on save' do
    user = FactoryGirl.create(:user, :recurly_account_code => nil)
    user.recurly_account_code.should_not be_blank
  end
end
