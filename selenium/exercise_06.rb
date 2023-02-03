require 'selenium-webdriver'

class Exercise_06
    attr_accessor :driver, :site_url

    def initialize(path_to_driver, url)
        Selenium::WebDriver::Chrome.driver_path = path_to_driver
        @driver = Selenium::WebDriver.for :chrome
        @site_url = url
        @driver.get(@site_url)
    end
    
    def get_dropdown_content()
        # content = driver.find_elements(:css, "#countrycode + .control .select select option")
        # content.each { |n| puts "Option : #{n.text}" }

        dropdown = driver.find_element(:class, "select")
        puts dropdown.text
    end    
end

path_to_driver = "C:\\Users\\Archita\\Documents\\Work_Infuse\\Training\\selenium\\chromedriver_win32\\chromedriver.exe"
site = "https://letcode.in/forms"
ex6 = Exercise_06.new(path_to_driver, site)
ex6.get_dropdown_content()