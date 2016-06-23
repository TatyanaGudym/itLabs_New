# 2. add to your solution next test

#create project
#make a random action: create or not a new bug issue
#open project page,
#open issues tab
#if there is a bug present then add self to watchers
#if no then create a new bug issue and then add self to watchers
#Verify that there is a bug issue and that current user is a watcher


require 'test/unit'
require 'selenium-webdriver'
require_relative 'HelperMethods'

class Test_2 < Test::Unit::TestCase
  include HelperMethods

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  end


  def test_operators_constructions
    register_user
    create_new_project
    @driver.find_element(:class, 'issues').click
    check_watchers
    assert(@driver.find_element(:link, 'Firstname Lastname').displayed?)
    @wait.until {@driver.find_element(:id, 'watchers').displayed?}
    @driver.find_element(:class, 'delete').click
    @driver.find_element(:class, 'issues').click
    check_watchers
    assert(@driver.find_element(:link, 'Firstname Lastname').displayed?)
  end

  def teardown
    @driver.quit
  end
end
