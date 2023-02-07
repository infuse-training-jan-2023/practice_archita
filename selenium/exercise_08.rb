require 'selenium-webdriver'

class Exercise_08
    attr_accessor :driver, :site

    def initialize(path_to_driver, url)
        Selenium::WebDriver::Chrome.driver_path = path_to_driver
        @driver = Selenium::WebDriver.for :chrome
        @site_url = url
        @driver.get(@site_url)
    end
    
    def slide()
        iframe = driver.find_elements(:class, "demo-frame")[2]
        driver.switch_to.frame iframe
        slider_btn = driver.find_element(:class, "ui-slider-handle")
        slider_btn.click
        driver.action.send_keys(:arrow_right).perform
        driver.action.send_keys(:arrow_right).perform
        driver.action.send_keys(:arrow_right).perform
        driver.action.send_keys(:arrow_right).perform
        # driver.action.drag_and_drop_by(slider_btn, 100, 100).perform
        sleep(2)
    end    
end

path_to_driver = "C:\\Users\\Archita\\Documents\\Work_Infuse\\Training\\selenium\\chromedriver_win32\\chromedriver.exe"
site = "https://www.globalsqa.com/demo-site/sliders/#Steps"
ex8 = Exercise_08.new(path_to_driver, site)
ex8.slide()