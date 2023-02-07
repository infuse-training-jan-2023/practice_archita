require 'selenium-webdriver'

class Exercise_02
    attr_accessor :driver, :site

    def initialize(path_to_driver, url)
        Selenium::WebDriver::Chrome.driver_path = path_to_driver
        @driver = Selenium::WebDriver.for :chrome
        @site = url
    end
    
    def navigate_and_get_title()
        driver.get(site)
        sleep(3)
        puts "Page Title: #{driver.title}"
    end
end

path_to_driver = "C:\\Users\\Archita\\Documents\\Work_Infuse\\Training\\selenium\\chromedriver_win32\\chromedriver.exe"
url = "https://github.com/"
ex2 = Exercise_02.new(path_to_driver, url)
ex2.navigate_and_get_title()