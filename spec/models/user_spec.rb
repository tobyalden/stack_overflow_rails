require 'rails_helper'

describe User do
  it { should validate_confirmation_of :password }
  it { should validate_uniqueness_of :email}
  it 'should encrypt password before saving' do
    test_user = FactoryGirl.create(:user)
    expect(test_user.password_hash).not_to eq(nil)
  end
end
