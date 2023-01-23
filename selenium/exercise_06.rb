require 'selenium-webdriver'

class Exercise_06
    attr_accessor :driver, :site, :wait

    def initialize(path_to_driver, url)
        @wait = Selenium::WebDriver::Wait.new(:timeout => 20)
        Selenium::WebDriver::Chrome.driver_path = path_to_driver
        @driver = Selenium::WebDriver.for :chrome
        @site_url = url
        @driver.get(@site_url)
    end
    
    def get_dropdown_content()
        wait.until { driver.find_element(:css, "#countrycode + .control .select select option") }
        content = driver.find_elements(:css, "#countrycode + .control .select select option")
        content.each { |n| puts "Option : #{n.text}" }
    end    
end

path_to_driver = "C:\\Users\\Archita\\Documents\\Work_Infuse\\Training\\selenium\\chromedriver_win32\\chromedriver.exe"
site = "https://letcode.in/forms"
ex6 = Exercise_06.new(path_to_driver, site)
ex6.get_dropdown_content()