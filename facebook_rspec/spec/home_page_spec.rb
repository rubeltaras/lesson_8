require 'spec_helper'

RSpec.feature 'Login functionality' do

  scenario 'User should login with existing account' do
    user_navigate_to_facebook
    fill_form_with_existing_credentials
    @home_page.login_button.click
    expect(@home_page.find_friends.text).to eq("Find Friends")
    Capybara.reset_session!
  end

  scenario 'User cannot register with already registered email' do
    user_navigate_to_facebook
    fill_form_with("used_email")
    @home_page.sign_up.click
    expect(@home_page.existing_user_alert.text).to eq("There is an existing account associated with this email.")
    Capybara.reset_session!
  end

  scenario 'User cannot register with unexisting email' do
    user_navigate_to_facebook
    fill_form_with("unexisting_email")
    @home_page.sign_up.click
    expect(@home_page.sorry_message.text).to eq("Sorry, we are not able to process your registration.")
    Capybara.reset_session!
  end

  scenario 'User should not be abel to register with blank email' do
    user_navigate_to_facebook
  fill_form_with_blank('email_or_mobile')
  @home_page.sign_up.click
  expect(HomePage.new).to be_displayed
  end

  scenario 'User should not be abel to register with blank first name' do
    user_navigate_to_facebook
    fill_form_with_blank('first_name')
    @home_page.sign_up.click
    expect(HomePage.new).to be_displayed
  end

  scenario 'User should not be abel to register with blank last name' do
    user_navigate_to_facebook
    fill_form_with_blank('last_name')
    @home_page.sign_up.click
    expect(HomePage.new).to be_displayed
  end

  scenario 'User should not be abel to register with blank password' do
    user_navigate_to_facebook
    fill_form_with_blank('password')
    @home_page.sign_up.click
    expect(HomePage.new).to be_displayed
  end
  scenario 'User should not be abel to register with blank birthday' do
    user_navigate_to_facebook
    fill_form_with_blank('checkbox_day')
    @home_page.sign_up.click
    expect(HomePage.new).to be_displayed
  end

  scenario 'User should not be abel to register with blank gender' do
    user_navigate_to_facebook
    fill_form_with_blank('gender_male')
    @home_page.sign_up.click
    expect(HomePage.new).to be_displayed
  end
end
