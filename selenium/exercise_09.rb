require 'selenium-webdriver'

class Exercise_09
    attr_accessor :driver, :site, :wait

    def initialize(path_to_driver, url)
        @wait = Selenium::WebDriver::Wait.new(:timeout => 20)
        Selenium::WebDriver::Chrome.driver_path = path_to_driver
        @driver = Selenium::WebDriver.for :chrome
        @site_url = url
        @driver.get(@site_url)
    end
    
    def get_table_headers()
        wait.until { driver.find_element(:css, ".inside-article") }
        headers = driver.find_elements(:css, "td>h3>strong")
        headers.each { | header | puts header.text }
    end    
end

path_to_driver = "C:\\Users\\Archita\\Documents\\Work_Infuse\\Training\\selenium\\chromedriver_win32\\chromedriver.exe"
site = "https://cosmocode.io/automation-practice-webtable/"
ex9 = Exercise_09.new(path_to_driver, site)
ex9.get_table_headers()