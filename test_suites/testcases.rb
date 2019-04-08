def tc_01(browser)
  preparing_browser(browser)

  login_menu_item = @browser.element(:xpath => "//a[contains(text(),'Login')]")
  login_menu_item.click if login_menu_item
  sleep(5)

  if @browser.title == 'Demo web application - Login form'
    write_result(__method__, browser,:passed)
  else
    write_result(__method__, browser,:failed)
  end

  @browser.close
end

def tc_02(browser)
  preparing_browser(browser)
  login_menu_item = @browser.element(:xpath => "//a[contains(text(),'Login')]")
  login_menu_item.click if login_menu_item
  @browser.wait_until {|b| b.title == "Demo web application - Login form"}

  @browser.text_field(:id, 'user_email').set(USER_LOGIN)
  # email = @browser.element(:xpath => "//input[@id='user_email']")
  # email.set 'amigoo@mail.net'
  @browser.text_field(:id, 'user_password').set(USER_PASSWORD)
  # passwd = @browser.element(:xpath => "//input[@id='user_password']")
  # passwd.set 'zse4rfvcxdr5'

  submit = @browser.element(:xpath => "//input[@value='Log in']")
  submit.click
end