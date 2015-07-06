require 'rails_helper'

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
