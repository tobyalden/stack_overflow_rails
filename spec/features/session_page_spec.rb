require 'rails_helper'

describe 'logging in successfully' do
  it 'displays a link to a login page on the index' do
    test_user = FactoryGirl.create(:user)
    visit '/'
    click_on 'Log In'
    fill_in 'Email', :with => 'john@gmail.com'
    fill_in 'Password', :with => 'badpassword'
    click_on 'Log in'
    expect(page).to have_content 'Current User: john@gmail.com'
  end
end

describe 'logging in unsuccessfully' do
  it 'displays a link to a login page on the index' do
    test_user = FactoryGirl.create(:user)
    visit '/'
    click_on 'Log In'
    fill_in 'Email', :with => 'john@gmail.com'
    fill_in 'Password', :with => 'rubbish'
    click_on 'Log in'
    expect(page).to have_content 'There was a problem logging you in.'
  end
end

describe 'logging out successfully' do
  it 'displays a link to a logout page on the index' do
    test_user = FactoryGirl.create(:user)
    visit '/'
    click_on 'Log In'
    fill_in 'Email', :with => 'john@gmail.com'
    fill_in 'Password', :with => 'badpassword'
    click_on 'Log in'
    click_on 'Log Out'
    expect(page).to have_content 'You\'ve been logged out successfully.'
  end
end
