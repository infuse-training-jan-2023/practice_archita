require 'selenium-webdriver'

class Exercise_03
    attr_accessor :driver, :site, :wait

    def initialize(path_to_driver, url)
        @wait = Selenium::WebDriver::Wait.new(:timeout => 20)
        Selenium::WebDriver::Chrome.driver_path = path_to_driver
        @driver = Selenium::WebDriver.for :chrome
        @site = url
        @driver.get(@site)
    end
    
    def click_btn()
        wait.until { driver.find_element(:class, "ExternalPages__Cta-sc-xufua5-8") }
        driver.find_element(:class, 'ExternalPages__Cta-sc-xufua5-8').click
        sleep(3)
    end
end

path_to_driver = "C:\\Users\\Archita\\Documents\\Work_Infuse\\Training\\selenium\\chromedriver_win32\\chromedriver.exe"
site = "https://undraw.co/"
ex3 = Exercise_03.new(path_to_driver, site)
ex3.click_btn()