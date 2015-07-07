require 'rails_helper'

def user_log_in(email)
  test_user = FactoryGirl.create(:user, :email => email)
  visit '/'
  click_on 'Log In'
  fill_in 'Email', :with => email
  fill_in 'Password', :with => 'badpassword'
  click_on 'Log in'
end

def admin_log_in
  test_admin = FactoryGirl.create(:user, :email => "admin@gmail.com")
  test_admin.update(:admin? => true)
  visit '/'
  click_on 'Log In'
  fill_in 'Email', :with => "admin@gmail.com"
  fill_in 'Password', :with => 'badpassword'
  click_on 'Log in'
end

describe 'successfully creating a new user' do
  it 'displays a link to a login page on the index' do
    visit '/'
    click_on 'Sign Up'
    fill_in 'Email', :with => 'john@gmail.com'
    fill_in 'Password', :with => 'badpassword'
    fill_in 'Password confirmation', :with => 'badpassword'
    click_on 'new-user'
    expect(page).to have_content 'Sign up success!'
  end
end

describe 'unsuccessfully creating a new user (password mismatch)' do
  it 'displays a link to a login page on the index' do
    visit '/'
    click_on 'Sign Up'
    fill_in 'Email', :with => 'john@gmail.com'
    fill_in 'Password', :with => 'badpassword'
    fill_in 'Password confirmation', :with => 'badpassword2'
    click_on 'new-user'
    expect(page).to have_content 'There was a problem creating your account. Please try again.'
  end
end

describe 'unsuccessfully creating a new user (user already exists)' do
  it 'displays a link to a login page on the index' do
    test_user = FactoryGirl.create(:user)
    visit '/'
    click_on 'Sign Up'
    fill_in 'Email', :with => 'john@gmail.com'
    fill_in 'Password', :with => 'badpassword'
    fill_in 'Password confirmation', :with => 'badpassword'
    click_on 'new-user'
    expect(page).to have_content 'There was a problem creating your account. Please try again.'
  end
end



describe 'unsuccessfully access all users page (not logged in)' do
  it 'does not allow non-admins to see all users' do
    visit users_path
    expect(page).to have_content('You are not authorized to perform this action.')
  end
end

describe 'unsuccessfully access all users page (logged in as non-admin)' do
  it 'does not allow non-admins to see all users' do
    user_log_in("dave@party.net")
    visit users_path
    expect(page).to have_content('You are not authorized to perform this action.')
  end
end

describe 'takes user to their profile page' do
  it 'displays all the questions the user has posted' do
    user_log_in('john@gmail.com')
    click_on 'john@gmail.com'
    expect(page).to have_content 'Questions john@gmail.com has posted:'
  end
end
