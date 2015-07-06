require 'rails_helper'

describe 'successfully creating a new question' do
  it 'displays a link to a login page on the index' do
    user_log_in("john@gmail.com")
    click_on 'Add a New Question'
    fill_in 'Title', :with => 'How do I computer'
    fill_in 'Body', :with => 'pls help'
    click_on 'Submit Question'
    expect(page).to have_content 'How do I computer'
  end
end

describe 'unsuccessfully creating a new question' do
  it 'displays a link to a login page on the index' do
    user_log_in("john@gmail.com")
    click_on 'Add a New Question'
    click_on 'Submit Question'
    expect(page).to have_content 'There was a problem posting your question. Try again.'
  end
end

describe 'the path to the questions index page' do
  it 'displays all the questions on the index page' do
    test_question = FactoryGirl.create(:question)
    visit '/'
    expect(page).to have_content 'how do i computer'
  end
end

describe 'the path to an individual question show page' do
  it 'displays the page of a single question' do
    test_question = FactoryGirl.create(:question)
    visit '/'
    click_on test_question.id
    expect(page).to have_content 'halp'
  end
end

describe 'the path to answer a question' do
  it "displays a link to a form on each question's page" do
    user_log_in("susan@gmail.com")
    test_question = FactoryGirl.create(:question)
    visit '/'
    click_on test_question.id
    fill_in 'Body', :with => 'git good'
    click_on 'Submit Answer'
    expect(page).to have_content('git good')
  end
end

describe 'unsuccessfully answer a question' do
  it "displays a link to a form on each question's page" do
    user_log_in("susan@gmail.com")
    test_question = FactoryGirl.create(:question)
    visit '/'
    click_on test_question.id
    click_on 'Submit Answer'
    expect(page).to have_content('Uh oh. Something went wrong. Try again.')
  end
end
