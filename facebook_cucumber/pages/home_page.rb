require 'site_prism'

HOME = "https://www.facebook.com/"
SU_FIRST_NAME = ".//*[@id='u_0_b']"
LAST_NAME = "//*[@id='u_0_d']"
SIGN_UP = ".//*[@id='u_0_s']"
ALERT_QUESTION = ".//*[@id='js_10']"
EMAIL_OR_MOBILE = ".//*[@id='u_0_f']"
RE_ENT_EMAIL_OR_MOBILE = ".//*[@id='u_0_i']"
PASSSWORD = ".//*[@id='u_0_k']"
GENDER_FEMALE = ".//*[@id='u_0_n']"
GENDER_MALE = ".//*[@id='u_0_o']"
CHECKBOX_MONTH = ".//*[@id='month']/option[2]"
CHECKBOX_DAY = ".//*[@id='day']/option[2]"
CHECKBOX_YEAR = ".//*[@id='year']/option[2]"
LOGIN_MAIN = ".//*[@id='email']"
PASSWORD_MAIN = ".//*[@id='pass']"
LOGIN_BUTTON = ".//*[@id='loginbutton']"
FIND_FRIENDS = ".//*[@id='findFriendsNav']"
EXISTING_USER_MESSAGE = ".//*[@id='reg_error_inner']"
SORRY_MESSAGE = ".//*[@id='reg']/div/div"

class HomePage < SitePrism::Page
  set_url HOME
  element :logout,:xpath, SIGN_UP
  element :first_name,:xpath, SU_FIRST_NAME
  element :last_name,:xpath, LAST_NAME
  element :sign_up,:xpath, SIGN_UP
  element :alert_question,:xpath, ALERT_QUESTION
  element :email_or_mobile,:xpath, EMAIL_OR_MOBILE
  element :re_email_or_mobile,:xpath, RE_ENT_EMAIL_OR_MOBILE
  element :password,:xpath, PASSSWORD
  element :gender_female,:xpath, GENDER_FEMALE
  element :gender_male,:xpath, GENDER_MALE
  element :checkbox_month,:xpath, CHECKBOX_MONTH
  element :checkbox_day,:xpath, CHECKBOX_DAY
  element :checkbox_year,:xpath, CHECKBOX_YEAR
  element :login,:xpath, LOGIN_MAIN
  element :password_main,:xpath, PASSWORD_MAIN
  element :login_button,:xpath, LOGIN_BUTTON
  element :find_friends,:xpath, FIND_FRIENDS
  element :existing_user_alert,:xpath, EXISTING_USER_MESSAGE
  element :sorry_message, :xpath, SORRY_MESSAGE
end
