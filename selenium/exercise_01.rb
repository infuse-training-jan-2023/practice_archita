require 'selenium-webdriver'

class Exercise_01
    attr_accessor :driver

    def initialize(path_to_driver)
        Selenium::WebDriver::Chrome.driver_path = path_to_driver
        @driver = Selenium::WebDriver.for :chrome
    end
    
    def maximize_browser()
        driver.manage.window.maximize
        sleep(3)
        driver.close()
    end
end

path_to_driver = "C:\\Users\\Archita\\Documents\\Work_Infuse\\Training\\selenium\\chromedriver_win32\\chromedriver.exe"
ex1 = Exercise_01.new(path_to_driver)
ex1.maximize_browser()