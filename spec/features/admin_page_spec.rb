require 'rails_helper'

describe 'successfully access all users page' do
  it 'allows the admin to see all the users' do
    admin_log_in
    test_user = FactoryGirl.create(:user)
    visit users_path
    expect(page).to have_content(test_user.email)
  end
end

describe 'successfully makes a non-admin an admin' do
  it 'displays a link next to a user to assign them as admin' do
    non_admin_user = FactoryGirl.create(:user)
    admin_log_in
    click_on 'Admin Panel'
    click_on non_admin_user.id
    expect(page).to have_content "#{non_admin_user.email} was given admin status."
  end
end

describe 'successfully deletes non-admin users' do
  it 'displays a link next to a user to delete their account' do
    non_admin_user = FactoryGirl.create(:user)
    admin_log_in
    click_on 'Admin Panel'
    click_on "delete #{non_admin_user.id}"
    expect(page).to have_content "#{non_admin_user.email} has been deleted."
  end
end
