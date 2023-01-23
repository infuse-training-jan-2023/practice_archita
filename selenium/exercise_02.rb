require 'selenium-webdriver'

class Exercise_02
    attr_accessor :driver

    def initialize(path_to_driver)
        Selenium::WebDriver::Chrome.driver_path = path_to_driver
        @driver = Selenium::WebDriver.for :chrome
    end
    
    def navigate_and_get_title(site)
        driver.get(site)
        sleep(3)
        puts "Page Title: #{driver.title}"
    end
end

path_to_driver = "C:\\Users\\Archita\\Documents\\Work_Infuse\\Training\\selenium\\chromedriver_win32\\chromedriver.exe"
ex2 = Exercise_02.new(path_to_driver)
ex2.navigate_and_get_title("https://github.com/")