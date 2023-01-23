require 'selenium-webdriver'

class Exercise_08
    attr_accessor :driver, :site, :wait

    def initialize(path_to_driver, url)
        @wait = Selenium::WebDriver::Wait.new(:timeout => 20)
        Selenium::WebDriver::Chrome.driver_path = path_to_driver
        @driver = Selenium::WebDriver.for :chrome
        @site_url = url
        @driver.get(@site_url)
    end
    
    def slide()
        wait.until { driver.find_element(:css, "iframe[data-src='../../demoSite/practice/slider/steps.html']") }
        driver.switch_to.frame driver.find_element(:css, "iframe[data-src='../../demoSite/practice/slider/steps.html']")
        wait.until { driver.find_element(:css, "span[tabindex='0']") }
        slider_btn = driver.find_element(:css, "span[tabindex='0']")
        driver.action.drag_and_drop_by(slider_btn, 100, 100).perform
        sleep(2)
    end    
end

path_to_driver = "C:\\Users\\Archita\\Documents\\Work_Infuse\\Training\\selenium\\chromedriver_win32\\chromedriver.exe"
site = "https://www.globalsqa.com/demo-site/sliders/#Steps"
ex8 = Exercise_08.new(path_to_driver, site)
ex8.slide()