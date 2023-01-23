require 'selenium-webdriver'

class Exercise_05
    attr_accessor :driver, :site, :wait

    def initialize(path_to_driver, url)
        @wait = Selenium::WebDriver::Wait.new(:timeout => 20)
        Selenium::WebDriver::Chrome.driver_path = path_to_driver
        @driver = Selenium::WebDriver.for :chrome
        @site_url = url
        @driver.get(@site_url)
    end
    
    def search(search_txt)
        wait.until { driver.find_element(:name, "q") }
        search_bar = driver.find_element(:name, "q")
        search_bar.send_keys(search_txt)
        sleep(1)
        search_bar.send_keys(:enter)
    end    
end

path_to_driver = "C:\\Users\\Archita\\Documents\\Work_Infuse\\Training\\selenium\\chromedriver_win32\\chromedriver.exe"
site = "https://www.google.com/"
ex5 = Exercise_05.new(path_to_driver, site)
ex5.search("Automation Testing with Selenium")