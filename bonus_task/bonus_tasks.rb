require 'test/unit'
require 'selenium-webdriver'

class TestBonusTasks < Test::Unit::TestCase

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  end

  def test_hover
    @driver.navigate.to 'https://the-internet.herokuapp.com/hovers'
    userimage = @driver.find_element(:class,'figure')
    @driver.action.move_to(userimage).perform
    assert(@driver.find_element(:link, 'View profile').displayed?)
  end

  def test_drag_and_drop
    @driver.navigate.to 'https://the-internet.herokuapp.com/drag_and_drop'
    el1 = @driver.find_element(:id, 'column-a')
    el2 = @driver.find_element(:id, "column-b")
    dnd_javascript = File.read(Dir.pwd + '/dnd.js')
    @driver.execute_script(dnd_javascript+"$('#column-a').simulateDragDrop({ dropTarget: '#column-b'});")
    assert (el1.text.include? 'B')
  end

  def test_dropdown
    @driver.navigate.to 'https://the-internet.herokuapp.com/dropdown'
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id,'dropdown')).select_by :text, 'Option 2'
    assert(@driver.find_element(id: 'dropdown').text.include? 'Option 2')
  end

  def test_iframes
    @driver.navigate.to 'https://the-internet.herokuapp.com/iframe'
    @driver.switch_to.frame('mce_0_ifr')
    assert(@driver.find_element(id: 'tinymce').text.include? 'Your content goes here.')
  end

  def test_press_key
    @driver.navigate.to 'https://the-internet.herokuapp.com/key_presses'
    @driver.find_element(class: 'example').send_keys :enter
    assert(@driver.find_element(id: 'result').text.include? 'You entered: ENTER')
  end


  def test_JQueryUI_menu
    @driver.navigate.to 'https://the-internet.herokuapp.com/jqueryui/menu'
    menu_item = @driver.find_element(:id,'ui-id-3')
    @driver.action.move_to(menu_item).perform
    @wait.until {@driver.find_element(:id, 'ui-id-4').displayed? }
    item2 = @driver.find_element(:id,'ui-id-8')
    @wait.until {item2.displayed?}
    item2.click
    assert(@driver.find_element(class: 'example').text.include? 'JQuery UI')
  end

  def test_javascript_alerts
    @driver.navigate.to 'https://the-internet.herokuapp.com/javascript_alerts'

    @driver.find_elements(css: 'button')[0].click
    popup = @driver.switch_to.alert
    popup.accept
    assert(@driver.find_element(id: 'result').text.include? 'You successfuly clicked an alert')


    @driver.find_elements(css: 'button')[1].click
    popup = @driver.switch_to.alert
    popup.accept
    assert(@driver.find_element(id: 'result').text.include? 'You clicked: Ok')


    @driver.find_elements(css: 'button')[2].click
    popup = @driver.switch_to.alert
    popup.send_keys('Hello!')
    popup.accept
    assert(@driver.find_element(id: 'result').text.include? 'You entered: Hello!')

  end


  def test_multiple_windows
    @driver.navigate.to 'https://the-internet.herokuapp.com/windows'
    first_window = @driver.window_handle

    @driver.find_element(:link, 'Click Here').click

    all_windows = @driver.window_handles
    new_window = all_windows.select { |this_window| this_window != first_window }

    @driver.switch_to.window(first_window)
    assert(@driver.find_element(class: 'example').text.include? 'Opening a new window')

    @driver.switch_to.window(new_window)
    assert(@driver.find_element(class: 'example').text.include? 'New Window')

  end


  def teardown
    @driver.quit
  end

end