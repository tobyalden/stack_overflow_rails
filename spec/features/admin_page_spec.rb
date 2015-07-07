require 'rails_helper'

describe 'successfully makes a non-admin an admin' do
  it 'displays a link next to a user to assign them as admin' do
    non_admin_user = FactoryGirl.create(:user)
    admin_log_in
    visit users_path
    click_on non_admin_user.id
    expect(page).to have_content "#{non_admin_user.email} was given admin status."
  end
end

describe 'successfully deletes non-admin users' do
  it 'displays a link next to a user to delete their account' do
    non_admin_user = FactoryGirl.create(:user)
    admin_log_in
    visit users_path
    click_on "delete #{non_admin_user.id}"
    # page.accept_alert
    expect(page).to have_content "#{non_admin_user.email} has been deleted."
  end
end
