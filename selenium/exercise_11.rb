require 'selenium-webdriver'

class Exercise_11
    attr_accessor :driver, :site, :wait

    def initialize(path_to_driver, url)
        @wait = Selenium::WebDriver::Wait.new(:timeout => 20)
        Selenium::WebDriver::Chrome.driver_path = path_to_driver
        @driver = Selenium::WebDriver.for :chrome
        @site_url = url
        @driver.get(@site_url)
    end
    
    def get_cell_value(n)
        wait.until { driver.find_element(:class, "example") }
        cells = driver.find_elements(:tag_name, "td")
        puts "Cell #{n}: #{cells[n - 1].text}"
    end    
end

path_to_driver = "C:\\Users\\Archita\\Documents\\Work_Infuse\\Training\\selenium\\chromedriver_win32\\chromedriver.exe"
site = "https://the-internet.herokuapp.com/tables"
ex11 = Exercise_11.new(path_to_driver, site)
ex11.get_cell_value(4)