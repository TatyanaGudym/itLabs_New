require 'test/unit'
require 'selenium-webdriver'
require_relative 'HelperMethods'


class TestRegistration < Test::Unit::TestCase
  include HelperMethods

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  end

  def test_registration
    register_user
    expected_text_en = 'Your account has been activated. You can now log in.'
    expected_text_ru = 'Ваша учётная запись активирована. Вы можете войти.'
    actual_text = @driver.find_element(:id, 'flash_notice').text
    assert(actual_text.include?(expected_text_en) || actual_text.include?(expected_text_ru))
  end

   def test_logout
     register_user
     logout
     login_button = @driver.find_element(:class, 'login')
     assert (login_button.displayed?)
   end

  def test_login
    register_user
    logout
    login
    logout_button = @driver.find_element(:class, 'logout')
    assert(logout_button.displayed?)
  end

  def test_change_password
    register_user
    change_password
    expected_text_en = 'Password was successfully updated.'
    expected_text_ru = 'Пароль успешно обновлён.'
    actual_text = @driver.find_element(:id, 'flash_notice').text
    assert(actual_text.include?(expected_text_en) || actual_text.include?(expected_text_ru))
  end

  def test_create_new_project
    register_user
    create_new_project
    expected_text_en = 'Successful creation.'
    expected_text_ru = 'Создание успешно.'
    actual_text = @driver.find_element(:id, 'flash_notice').text
    assert(actual_text.include?(expected_text_en) || actual_text.include?(expected_text_ru))
  end

def test_create_project_version
  register_user
  create_new_project
  create_project_version
  #sleep 30
  project_new = @project.new_version_name
  assert(@driver.find_element(:link, project_new).displayed?)
end

  def test_create_bug_issue
    register_user
    create_new_project
    create_bug_issue
    @driver.find_element(:class, 'issues').click
    assert(@driver.find_element(:link, 'This is new Bug issue').displayed?)
  end


  def test_create_feature
    register_user
    create_new_project
    create_feature
    @driver.find_element(:class, 'issues').click
    assert(@driver.find_element(:link, 'This is new Feature issue').displayed?)
  end

  def test_create_support
    register_user
    create_new_project
    create_support
    @driver.find_element(:class, 'issues').click
    assert(@driver.find_element(:link, 'This is new Support issue').displayed?)
  end


  def teardown
  @driver.quit
  end
  
end