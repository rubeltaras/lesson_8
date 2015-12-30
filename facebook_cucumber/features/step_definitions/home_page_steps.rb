Given  (/there is a facebook home page/) do
  Capybara.reset_session!
  @home_page = HomePage.new
  @home_page.load
end


When(/^fill form with existing credentials$/) do
  @home_page.login.set "userfortestpurpose@gmail.com"
  @home_page.password_main.set "somepassword123"
end

Then(/^user should be logged in$/) do
  expect(@home_page.find_friends.text).to eq("Find Friends")
end

When(/^user fill_form_with "([^"]*)"$/) do |email|
  @home_page.first_name.set "user"
  @home_page.last_name.set "user_last_name"
  @home_page.password.set "some_passwordr44343"
  @home_page.gender_male.click
  @home_page.checkbox_day.click
  @home_page.checkbox_year.click
  @home_page.checkbox_month.click
  if email == "used_email" then
    @home_page.email_or_mobile.set "userfortestpurpose@gmail.com"
    @home_page.re_email_or_mobile.set "userfortestpurpose@gmail.com"
  else
    @home_page.email_or_mobile.set "ololo123@gmail.com"
    @home_page.re_email_or_mobile.set "ololo123@gmail.com"
  end
end

Then(/^user should see error message that email is already registered$/) do
  expect(@home_page.existing_user_alert.text).to eq("There is an existing account associated with this email.")
end

And(/^click on sign_up button$/) do
  @home_page.sign_up.click
end

And(/^press login button$/) do
  @home_page.login_button.click
end

Then(/^user should see error message that he is not able to continue registation$/) do
  expect(@home_page.sorry_message.text).to eq("Sorry, we are not able to process your registration.")
end

When(/^fill form with blank "([^"]*)"$/) do |exception|
  data = {
      "first_name" => "user",
      "last_name" => "user_last_name",
      "email_or_mobile" => "sample@email.com",
      "re_email_or_mobile" => "sample@email.com",
      "password" => "some_password",
      "checkbox_month" => "Feb",
      "checkbox_day" => "10",
      "checkbox_year" => "1993",
      "gender_male" => "male"}

  data.delete(exception)

  until data.length==0 do
    input = data.shift
    element = input[0].to_s

    case element
      when "first_name"         then @home_page.first_name.set "user"
      when "last_name"          then @home_page.last_name.set "user_last_name"
      when "email_or_mobile"    then @home_page.email_or_mobile.set "sample@email.com"
      when "re_email_or_mobile" then @home_page.re_email_or_mobile.set "sample@email.com"
      when "password"           then @home_page.password.set "some_password"
      when "gender_male"        then @home_page.gender_male.click
      when "checkbox_day"       then @home_page.checkbox_day.click
      when "checkbox_year"      then @home_page.checkbox_year.click
      when "checkbox_month"     then @home_page.checkbox_month.click
    end
  end
end

Then(/^user should see error message and stay on home page$/) do
  expect(HomePage.new).to be_displayed
end