
def tc_03(browser)
  # ------------------------case tc_03.1-----------------------------
  preparing_browser(browser)

  login_menu_item = @browser.element(:xpath => "//a[contains(text(),'Login')]")
  login_menu_item.click if login_menu_item
  @browser.wait_until {|b| b.title == "Demo web application - Login form"}

  @browser.text_field(id: 'user_email').set(USER_LOGIN)
  @browser.text_field(id: 'user_password').set(USER_PASSWORD)
  @browser.checkbox(:id => 'user_remember_me').click!
  sleep(CLICK_TIMEOUT)

  submit = @browser.element(:xpath => "//input[@value='Log in']")
  submit.click
  sleep(CLICK_TIMEOUT)

  tc_name = "#{__method__}.1"

  if @browser.element(:xpath => "//a[contains(text(), 'Logout')]").exists?
    write_result(tc_name, browser,:passed)
  else
    write_result(tc_name, browser,:failed)
  end

  # --------------------------case tc_03.2-------------------------------
  my_cookies = @browser.cookies.to_a
  @browser.close

  preparing_browser(browser)

  my_cookies.each {|cookie| @browser.cookies.add(cookie[:name], cookie[:value])}

  @browser.refresh
  @browser.wait_until { |b| b.title == "Demo web application - Home" }
  sleep(CLICK_TIMEOUT)

  tc_name = "#{__method__}.2"

  if @browser.element(:xpath => "//a[contains(text(), 'Logout')]").exists?
    write_result(tc_name, browser,:passed)
  else
    write_result(tc_name, browser,:failed)
    @browser.close
    abort
  end

  # ---------------------------case tc_03.03------------------------------
  @browser.link(:text =>"Logout").when_present.click
  my_cookies = @browser.cookies.to_a

  sleep(CLICK_TIMEOUT)
  @browser.close

  preparing_browser(browser)

  my_cookies.each {|cookie| @browser.cookies.add(cookie[:name], cookie[:value])}

  @browser.refresh
  @browser.wait_until { |b| b.title == "Demo web application - Home" }

  tc_name = "#{__method__}.3"

  if @browser.element(:xpath => "//a[contains(text(), 'Logout')]").exists?
    write_result(tc_name, browser, :failed)
  else
    write_result(tc_name, browser, :passed)
  end

  @browser.close
end